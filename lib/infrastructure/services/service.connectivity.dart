import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

@singleton
class ConnectivityService {
  final bool _isConnected;

  ConnectivityService._(this._isConnected);

  bool get isConnected => _isConnected;

  @factoryMethod
  static Future<ConnectivityService> inject() async {
    final connectivityResult = await Connectivity().checkConnectivity();

    return ConnectivityService._(
        connectivityResult == ConnectivityResult.wifi ||
            connectivityResult == ConnectivityResult.mobile);
  }
}