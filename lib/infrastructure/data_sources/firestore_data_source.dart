import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDataSource {
  FirestoreDataSource({required FirebaseFirestore firestore})
      : _firestore = firestore;

  final FirebaseFirestore _firestore;

  // ユーザーフォルダ内部を参照
  CollectionReference<Map<String, dynamic>> _foldersRef(String userId) {
    return _firestore.collection('users').doc(userId).collection('folders');
  }

  Future<List<Map<String, dynamic>>> getFolders({
    required String userId,
  }) async {
    try {
      final snapshot = await _foldersRef(userId).get();
      return snapshot.docs.map((d) => {'id': d.id, ...d.data()}).toList();
    } on FirebaseException catch (_) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> createFolder({
    required String userId,
    required String name,
    String? parentFolderId,
  }) async {
    final data = {
      'name': name,
      'parentFolderId': parentFolderId,
      'createdAt': FieldValue.serverTimestamp(),
    };
    final ref = await _foldersRef(userId).add(data);
    final doc = await ref.get();
    return {'id': doc.id, ...doc.data()!};
  }

  Future<Map<String, dynamic>> updateFolder({
    required String userId,
    required String folderId,
    required String name,
  }) async {
    final ref = _foldersRef(userId).doc(folderId);
    await ref.update({'name': name});
    final doc = await ref.get();
    return {'id': doc.id, ...doc.data()!};
  }

  Future<void> deleteFolder({
    required String userId,
    required String folderId,
  }) async {
    await _cascadeDeleteFolder(userId: userId, folderId: folderId);
  }

  Future<void> _cascadeDeleteFolder({
    required String userId,
    required String folderId,
  }) async {
    final wordsSnap =
        await _foldersRef(userId).doc(folderId).collection('words').get();
    for (final doc in wordsSnap.docs) {
      await doc.reference.delete();
    }

    final resultsSnap = await _firestore
        .collection('users')
        .doc(userId)
        .collection('testResults')
        .where('folderId', isEqualTo: folderId)
        .get();
    for (final doc in resultsSnap.docs) {
      await doc.reference.delete();
    }

    final subFolders = await _foldersRef(userId)
        .where('parentFolderId', isEqualTo: folderId)
        .get();
    for (final doc in subFolders.docs) {
      await _cascadeDeleteFolder(userId: userId, folderId: doc.id);
    }

    await _foldersRef(userId).doc(folderId).delete();
  }

  // ---- words ----

  CollectionReference<Map<String, dynamic>> _wordsRef({
    required String userId,
    required String folderId,
  }) {
    return _foldersRef(userId).doc(folderId).collection('words');
  }

  Future<List<Map<String, dynamic>>> getWords({
    required String userId,
    required String folderId,
  }) async {
    final snapshot = await _wordsRef(userId: userId, folderId: folderId)
        .orderBy('createdAt')
        .get();
    return snapshot.docs.map((d) => {'id': d.id, ...d.data()}).toList();
  }

  Future<Map<String, dynamic>> createWord({
    required String userId,
    required String folderId,
    required String front,
    required String back,
  }) async {
    final data = {
      'front': front,
      'back': back,
      'createdAt': FieldValue.serverTimestamp(),
    };
    final ref = await _wordsRef(userId: userId, folderId: folderId).add(data);
    final doc = await ref.get();
    return {'id': doc.id, ...doc.data()!};
  }

  Future<Map<String, dynamic>> updateWord({
    required String userId,
    required String folderId,
    required String wordId,
    required String front,
    required String back,
  }) async {
    final ref = _wordsRef(userId: userId, folderId: folderId).doc(wordId);
    await ref.update({'front': front, 'back': back});
    final doc = await ref.get();
    return {'id': doc.id, ...doc.data()!};
  }

  Future<void> deleteWord({
    required String userId,
    required String folderId,
    required String wordId,
  }) {
    return _wordsRef(userId: userId, folderId: folderId).doc(wordId).delete();
  }

  // ---- testResults ----

  CollectionReference<Map<String, dynamic>> _testResultsRef(String userId) {
    return _firestore.collection('users').doc(userId).collection('testResults');
  }

  Future<List<Map<String, dynamic>>> getTestResults({
    required String userId,
    String? folderId,
  }) async {
    Query<Map<String, dynamic>> query =
        _testResultsRef(userId).orderBy('date', descending: true);
    if (folderId != null) {
      query = query.where('folderId', isEqualTo: folderId);
    }
    final snapshot = await query.get();
    return snapshot.docs.map((d) => {'id': d.id, ...d.data()}).toList();
  }

  Future<Map<String, dynamic>> saveTestResult({
    required String userId,
    required String folderId,
    required int totalCount,
    required int correctCount,
  }) async {
    final data = {
      'folderId': folderId,
      'totalCount': totalCount,
      'correctCount': correctCount,
      'date': FieldValue.serverTimestamp(),
    };
    final ref = await _testResultsRef(userId).add(data);
    final doc = await ref.get();
    return {'id': doc.id, ...doc.data()!};
  }

  // ---- settings ----

  DocumentReference<Map<String, dynamic>> _settingsRef(String userId) {
    return _firestore
        .collection('users')
        .doc(userId)
        .collection('settings')
        .doc('config');
  }

  Future<Map<String, dynamic>?> getSettings({required String userId}) async {
    final doc = await _settingsRef(userId).get();
    return doc.exists ? doc.data() : null;
  }

  Future<void> updateSettings({
    required String userId,
    required Map<String, dynamic> data,
  }) {
    return _settingsRef(userId).set(data, SetOptions(merge: true));
  }
}
