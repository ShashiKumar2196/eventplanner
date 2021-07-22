import 'package:eventplanner/Screens/sign_up_screen.dart';
import 'package:eventplanner/controllers/auth_controller.dart';
import 'package:eventplanner/controllers/network_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends GetWidget<AuthController> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/ui_images/Login.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 125,
                  top: 200,
                ),
                child: Text("Welcome Back!",
                    style: GoogleFonts.poppins(
                        color: const Color(0xff000000),
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        fontSize: 18.0),
                    textAlign: TextAlign.center),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 100, top: 225),
                child: Container(
                  child: Image.asset(
                    "assets/ui_images/login_page_center_image.png",
                    height: 175,
                    width: 175,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 425, left: 20, right: 20),
                child: TextFormField(
                  controller: controller.emailController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Enter your Email",
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 500, left: 20, right: 20),
                child: TextFormField(
                  controller: controller.passwordController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Enter password",
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 575, left: 125),
                child: Text("Forgot Password",
                    style: GoogleFonts.poppins(
                        color: const Color(0xb23cd8cf),
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        fontSize: 18.0),
                    textAlign: TextAlign.center),
              ),
              GestureDetector(
                onTap: () {
                  controller.checkLoginValidation(controller.emailController.text,
                      controller.passwordController.text);
                },
                child: Container(
                    margin:
                        const EdgeInsets.only(top: 625, left: 20, right: 20),
                    height: 50,
                    color: const Color(0xb23cd8cf),
                    alignment: Alignment.center,
                    child: Text("Sign In",
                        style: const TextStyle(
                            color: const Color(0xff000000),
                            fontWeight: FontWeight.w600,
                            fontFamily: "Poppins",
                            fontStyle: FontStyle.normal,
                            fontSize: 18.0),
                        textAlign: TextAlign.center)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 100, top: 700, bottom: 40),
                child: InkWell(
                  onTap: () {
                    Get.to(SignUpScreen());
                    controller.emailController.clear();
                    controller.passwordController.clear();
                  },
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        style: const TextStyle(
                            color: const Color(0xb2000000),
                            fontWeight: FontWeight.w400,
                            fontFamily: "Poppins",
                            fontStyle: FontStyle.normal,
                            fontSize: 13.0),
                        text: "Already have an account ? "),
                    TextSpan(
                      style: const TextStyle(
                          color: const Color(0xb23cd8cf),
                          fontWeight: FontWeight.w700,
                          fontFamily: "Poppins",
                          fontStyle: FontStyle.normal,
                          fontSize: 16.0),
                      text: "SignUp",
                    )
                  ])),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
