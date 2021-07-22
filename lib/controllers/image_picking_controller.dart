import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickController extends GetxController {
  XFile? image;

  String? imageUrl;

  final ImagePicker _picker = ImagePicker();
  final storage = FirebaseStorage.instance;

  void pickImage() async {
    try {
      image = await _picker.pickImage(source: ImageSource.gallery);
      var file = File(image!.path);
      print(file);
      if (file != null) {
        var snapShot = await storage.ref().child('EventImages / ${file.path}').putFile(file);
        var downLoadedUrl = await snapShot.ref.getDownloadURL();
        imageUrl = downLoadedUrl;
        print(imageUrl);
      } else {}
    } on Exception catch (e) {
      // TODO
      print(e);
    }
  }
}
