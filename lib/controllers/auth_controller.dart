import 'package:eventplanner/Screens/home_page.dart';
import 'package:eventplanner/Screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  Rxn<User?> firebaseUser = Rxn<User>();

  String? get user => firebaseUser.value?.email;

  late TextEditingController emailController, passwordController;

  @override
  void onInit() {
    firebaseUser.bindStream(auth.authStateChanges());
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  void createUser(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Get.snackbar('Successfully Account Created ', '',
          snackPosition: SnackPosition.BOTTOM);
    } on Exception catch (e) {
      // TODO
      Get.snackbar('Error creating account', '',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      Get.to(() => HomePage());
      emailController.clear();
      passwordController.clear();
    } on Exception catch (e) {
      // TODO
      Get.snackbar('Error signing into account', '',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void checkLoginValidation(String email, String password) {
    if (email.isEmpty || password.isEmpty) {
      return Get.snackbar('Please fill the fields', '',
          snackPosition: SnackPosition.BOTTOM);
    } else {
      login(email,password);
      email='';
      password='';
    }
  }

  void checkSignUpValidation(String email, String password) {
    if (email.isEmpty ||  password.isEmpty) {
      return Get.snackbar('Please fill the fields', '',
          snackPosition: SnackPosition.BOTTOM);
    } else {
      createUser(email, password);
    }
  }

  void signOut() async {
    await auth.signOut();
    return Get.to(LoginScreen());
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
