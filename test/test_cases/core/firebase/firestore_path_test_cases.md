# firestore_path_test_cases.md

## 対象クラス / メソッド

| 項目 | 値 |
|------|-----|
| ファイルパス | lib/core/firebase/firestore_path.dart |
| クラス名 | FirestorePath |
| テスト対象メソッド | folders() / folder() / words() / word() / testResults() / testResult() / settings() |

## テストケース一覧

| # | テスト名 | カテゴリ | 対象メソッド | 状態 |
|---|---------|---------|-----------|------|
| 1 | folders()は3セグメント(コレクション)のパスを返す | 正常系 | folders() | ✅ |
| 2 | folder()は4セグメント(ドキュメント)のパスを返す | 正常系 | folder() | ✅ |
| 3 | words()は5セグメント(コレクション)のパスを返す | 正常系 | words() | ✅ |
| 4 | word()は6セグメント(ドキュメント)のパスを返す | 正常系 | word() | ✅ |
| 5 | testResults()は3セグメント(コレクション)のパスを返す | 正常系 | testResults() | ✅ |
| 6 | testResult()は4セグメント(ドキュメント)のパスを返す | 正常系 | testResult() | ✅ |
| 7 | settings()は4セグメント(ドキュメント)のパスを返し、末尾がconfigである(バグ回帰テスト) | 異常系（バグ回帰） | settings() | ✅ |
| 8 | settings()はuserIdごとに異なるパスを返す | エッジケース | settings() | ✅ |

## テストケース詳細

### テストケース7: settings()は4セグメント(ドキュメント)のパスを返し、末尾がconfigである
- **カテゴリ**: 異常系（バグ回帰テスト）
- **対象メソッド**: settings()
- **入力条件**: `FirestorePath.settings('user-1')`を呼ぶ。
- **期待値**: `'users/user-1/settings/config'`（4セグメント、末尾が`config`）が返る。
- **背景**: 旧実装は`'users/$userId/settings'`という3セグメント（奇数）の
  コレクションパスを返しており、`FirestoreDataSource.writeSettings`が
  `_firestore.doc(...)`（偶数セグメントのドキュメントパスを要求）に渡すと
  実行時例外になっていた。本テストはこの不整合が再発しないことを保証する
  回帰テストである。
- **テストコード**:
  ```dart
  test(
    'settings()は4セグメント(ドキュメント)のパスを返し、末尾がconfigである'
    '(旧実装は users/{userId}/settings という3セグメントの'
    'コレクションパスを誤って返しており、_firestore.doc()に渡すと'
    '実行時例外になっていたバグの回帰テスト)',
    () {
      final path = FirestorePath.settings('user-1');
      expect(path, 'users/user-1/settings/config');
      expect(path.split('/'), hasLength(4));
      expect(path.split('/').last, 'config');
    },
  );
  ```

### テストケース8: settings()はuserIdごとに異なるパスを返す
- **カテゴリ**: エッジケース
- **対象メソッド**: settings()
- **入力条件**: 異なる2つのuserIdでそれぞれ`settings()`を呼ぶ。
- **期待値**: 2つのパスが一致しない。
