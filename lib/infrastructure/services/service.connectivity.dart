import "dart:async";

import "package:connectivity_plus/connectivity_plus.dart";
import "package:flutter/cupertino.dart";

class ConnectivityService {
  final Connectivity connectivity = Connectivity();
  late final ValueNotifier<ConnectivityResult> connectionStatusNotifier = ValueNotifier<ConnectivityResult>(ConnectivityResult.none);

  ConnectivityService();

  Future<ConnectivityResult> initConnectivity() async {
    late ConnectivityResult result;
    try {
      result = await connectivity.checkConnectivity();
    } catch (e) {
      throw Exception("Connectivity check failed");
    }
    return result;
  }

}