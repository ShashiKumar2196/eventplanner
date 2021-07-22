import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  int connectionType = 0;

  final Connectivity connectivity = Connectivity();

  late final StreamSubscription streamSubscription;

  @override
  void onInit() {
    getConnectionType();
    streamSubscription =
        connectivity.onConnectivityChanged.listen(updateConnectionState);
  }

  Future<void> getConnectionType() async {
    var connectivityResult;

    try {
      connectivityResult = await (connectivity.checkConnectivity());
    } on Exception catch (e) {
      // TODO
      print(e);
    }

    return updateConnectionState(connectivityResult);
  }

  updateConnectionState(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        connectionType = 1;
        update();
        Get.snackbar('Internet Connected', '',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green[300],
            duration: Duration(seconds: 2));
        break;
      case ConnectivityResult.mobile:
        connectionType = 2;
        update();
        Get.snackbar('Internet Connected ', '',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green[300],
            duration: Duration(seconds: 2)
        );
        break;
      case ConnectivityResult.none:
        connectionType = 0;
        update();
        Get.snackbar('No Internet Connection', '',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red[300],
            duration: Duration(seconds:2)
        );
        break;
      default:
        Get.snackbar('Network Error', 'Failed to get Network Status');
        break;
    }
  }

  @override
  void onClose() {
    streamSubscription.cancel();
  }
}
