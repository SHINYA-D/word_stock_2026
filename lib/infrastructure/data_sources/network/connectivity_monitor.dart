import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityMonitor {
  final Connectivity _connectivity = Connectivity();

  /// 現在オンラインかどうかを即座に確認
  Future<bool> isOnline() async {
    final result = await _connectivity.checkConnectivity();
    return result != ConnectivityResult.none;
  }

  /// ネットワーク状態の変化を監視
  Stream<bool> onStatusChanged() {
    return _connectivity.onConnectivityChanged.map((result) {
      return result != ConnectivityResult.none;
    });
  }
}
