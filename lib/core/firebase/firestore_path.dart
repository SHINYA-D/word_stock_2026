class FirestorePath {
  // --- folders ---
  static String folders(String userId) => 'users/$userId/folders';

  static String folder(String userId, String folderId) =>
      'users/$userId/folders/$folderId';

  // --- words ---
  static String words(String userId, String folderId) =>
      'users/$userId/folders/$folderId/words';

  static String word(String userId, String folderId, String wordId) =>
      'users/$userId/folders/$folderId/words/$wordId';

  // --- test_results ---
  static String testResults(String userId) => 'users/$userId/test_results';

  static String testResult(String userId, String testResultId) =>
      'users/$userId/test_results/$testResultId';

  // --- settings ---
  static String settings(String userId) => 'users/$userId/settings/config';
}
