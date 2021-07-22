import 'package:eventplanner/controllers/auth_controller.dart';
import 'package:eventplanner/controllers/create_event_controller.dart';
import 'package:eventplanner/controllers/home_page_controller.dart';
import 'package:eventplanner/controllers/network_controller.dart';
import 'package:get/get.dart';
import '../image_picking_controller.dart';

class AuthBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<CreateEventController>(() => CreateEventController());
    Get.lazyPut<HomePageController>(() => HomePageController());
    Get.lazyPut<NetworkController>(() => NetworkController());
    Get.lazyPut<ImagePickController>(() => ImagePickController());
  }

}