import 'package:eventplanner/controllers/auth_controller.dart';
import 'package:eventplanner/controllers/network_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';




class SignUpScreen extends GetWidget<AuthController>{

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                padding: const EdgeInsets.only(top: 200, left: 125),
                child: Text("Welcome OnBoard!!",
                    style: GoogleFonts.poppins(
                        color: const Color(0xff000000),
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        fontSize: 18.0),
                    textAlign: TextAlign.center),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 275),
                child: TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Enter your Email",
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 350),
                child: TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Enter password",
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  controller.checkSignUpValidation(_emailController.text, _passwordController.text);
                },
                child: Container(
                    margin:
                        const EdgeInsets.only(left: 20, right: 20, top: 450),
                    height: 50,
                    color: const Color(0xb23cd8cf),
                    alignment: Alignment.center,
                    child: Text("Sign Up",
                        style: const TextStyle(
                            color: const Color(0xff000000),
                            fontWeight: FontWeight.w600,
                            fontFamily: "Poppins",
                            fontStyle: FontStyle.normal,
                            fontSize: 18.0),
                        textAlign: TextAlign.center)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 525, left: 100),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
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
                        text: "SignIn")
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
