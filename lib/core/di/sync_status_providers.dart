import 'package:flutter_riverpod/flutter_riverpod.dart';

/// ログイン直後の初回同期（Firestore → SQLite）が進行中かどうか。
///
/// true の間はホーム画面への遷移をブロックする（[core/router/router.dart]）。
final authSyncInProgressProvider = StateProvider<bool>((ref) => false);
