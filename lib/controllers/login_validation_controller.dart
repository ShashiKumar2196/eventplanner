import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginValidationController extends GetxController{

  final GlobalKey<FormState> loginFormKey=GlobalKey<FormState>();

  late TextEditingController emailController,passwordController;

  var email='';
  var password='';

  @override
  void onInit() {
    emailController=TextEditingController();
    passwordController=TextEditingController();
  }


  String? validateEmail(String value){
    if(!GetUtils.isEmail(value)){
      return "Provide valid email";
    }
    return null;
  }

  String? validatePassword(String value){
    if(value.length<6){
      return "Password must be of 6 characters";
    }
    return null;
  }

  void checkLogin(){
    final isValid = loginFormKey.currentState!.validate();
    if(!isValid){
      return;
    }
    loginFormKey.currentState!.save();
  }


  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  void onReady() {

  }
}