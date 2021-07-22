import 'package:eventplanner/Screens/home_page.dart';
import 'package:eventplanner/Screens/login_screen.dart';
import 'package:eventplanner/controllers/auth_controller.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class Root extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Obx(() =>
        (Get.find<AuthController>().user != null) ? HomePage() : LoginScreen());
  }
}
