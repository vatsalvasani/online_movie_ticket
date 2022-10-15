import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:onlinemovieticket/pages/login_screen.dart';
import 'package:onlinemovieticket/utils/mytheme.dart';
import 'package:onlinemovieticket/utils/social_buttons.dart';
import 'package:http/http.dart' as http;
import 'package:onlinemovieticket/ipconfig.dart';
import 'dart:convert';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  _SignUpScreenState();

  bool showProgress = false;
  bool visible = false;
  final _formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  // CollectionReference ref = FirebaseFirestore.instance.collection('users');
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController confirmpassController = new TextEditingController();
  final TextEditingController name = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController mobile = new TextEditingController();
  bool _isObscure = true;
  bool _isObscure2 = true;
  File? file;

  // var successfull = 1;
  // TextEditingController name = TextEditingController();
  // TextEditingController email = TextEditingController();
  // TextEditingController password = TextEditingController();
  // TextEditingController recovery = TextEditingController();
  // TextEditingController phone = TextEditingController();
  //
  // String uri = ipcon+"movieticket_api/insert_user_record.php";
  //
  // Future<void> insertrecord() async{
  //   try{
  //     var res = await http.post(Uri.parse(uri),body: {
  //       "name" : name.text,
  //       "email" : email.text,
  //       "phone" : phone.text,
  //       "password" : password.text,
  //       "recovery" : recovery.text
  //     });
  //     var response = jsonDecode(res.body);
  //     if(response["success"] == "true")
  //     {
  //       successfull = 1;
  //     }
  //     else
  //     {
  //       successfull = 0;
  //     }
  //   }
  //   catch(e)
  //   {
  //     print(e);
  //     successfull = 0;
  //   }
  //
  // }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      backgroundColor: MyTheme.splash,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(

          height: _size.height,
          width: _size.width,
          child: Form(
        key: _formkey,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/icons/splash_icon.svg"),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                padding: const EdgeInsets.all(19),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: _size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Create your account",
                      style: TextStyle(
                        fontSize: 16,
                        color: MyTheme.splash,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.black),
                        controller: name,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Name",
                          hintStyle: const TextStyle(color: Colors.black45),
                          fillColor: MyTheme.greyColor,
                          filled: true,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.black),
                        controller: emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Email Address",
                          hintStyle: const TextStyle(color: Colors.black45),
                          fillColor: MyTheme.greyColor,
                          filled: true,
                        ),
                        validator: (value) {
                          if (value!.length == 0) {
                            return "Email cannot be empty";
                          }
                          if (!RegExp(
                              "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                              .hasMatch(value)) {
                            return ("Please enter a valid email");
                          } else {
                            return null;
                          }
                        },
                      ),

                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.black),
                        controller: mobile,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Phone No.",
                          hintStyle: const TextStyle(color: Colors.black45),
                          fillColor: MyTheme.greyColor,
                          filled: true,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.black),
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Password",
                          hintStyle: const TextStyle(color: Colors.black45),
                          fillColor: MyTheme.greyColor,
                          filled: true,
                        ),
                        validator: (value) {
                          RegExp regex = new RegExp(r'^.{6,}$');
                          if (value!.isEmpty) {
                            return "Password cannot be empty";
                          }
                          if (!regex.hasMatch(value)) {
                            return ("please enter valid password min. 6 character");
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.black),
                        controller: confirmpassController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Confirm Password",
                          hintStyle: const TextStyle(color: Colors.black45),
                          fillColor: MyTheme.greyColor,
                          filled: true,
                        ),
                        validator: (value) {
                          if (confirmpassController.text !=
                              passwordController.text) {
                            return "Password did not match";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {},
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                          setState(() {
                            showProgress = true;
                          });
                          signUp(
                            emailController.text,
                            passwordController.text,
                          );


                        // insertrecord();
                        // if(successfull == 1)
                        //   {
                        //     ScaffoldMessenger.of(context).showSnackBar(
                        //         const SnackBar(content: Text("Successfully Registered!!!")),
                        //     );
                        //   }
                        // else
                        //   {
                        //     ScaffoldMessenger.of(context).showSnackBar(
                        //       const SnackBar(content: Text("Sorry Some Internal Error Is There Try After Some Time!!")),
                        //     );
                        //   }


                      },
                      style: ElevatedButton.styleFrom(
                        primary: MyTheme.splash,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Text(
                            "SIGNUP",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.black.withOpacity(0.3),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: "Already have an account ? ",
                      style: TextStyle(fontWeight: FontWeight.w700,color: Colors.white),
                    ),
                    TextSpan(
                      text: "Login",
                      style: const TextStyle(decoration: TextDecoration.underline, fontWeight: FontWeight.w700,color: Colors.white),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.back();
                        },
                    ),
                    const TextSpan(
                      text: " here.",
                      style: TextStyle(fontWeight: FontWeight.w700,color: Colors.white),
                    ),
                  ],
                ),
              )
            ],
          ),
          ),
        ),
      ),
    );
  }
  signUp(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
          email: email,
          password: password,
        )
            .whenComplete(() => {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => LoginScreen(),
            ),
          )
        });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print("vatsal");
      }
    }

    CircularProgressIndicator();
  }

}