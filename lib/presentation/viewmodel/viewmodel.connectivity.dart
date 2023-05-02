import "dart:async";

import "package:connectivity_plus/connectivity_plus.dart";
import "package:flutter/cupertino.dart";

import "../../infrastructure/services/service.connectivity.dart";

class ConnectivityViewModel extends ChangeNotifier{
  final ConnectivityService connectivityService;
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  ConnectivityViewModel(this.connectivityService){
    connectivityService.initConnectivity().then((value) => _updateConnectionStatus(value));
    _connectivitySubscription = connectivityService.connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void  disposeService(){
    _connectivitySubscription.cancel();
    connectivityService.connectionStatusNotifier.dispose();
  }

  void _updateConnectionStatus(ConnectivityResult event) {
    connectivityService.connectionStatusNotifier.value = event;
    notifyListeners();
  }

  ConnectivityResult? get connectionStatus => connectivityService.connectionStatusNotifier.value;
}