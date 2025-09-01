import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_smit/Login/Signup/login_screen.dart';
import 'package:hackathon_smit/service/firebase_auth_method.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  //  controller for login user
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // TextEditingController fullNameController = TextEditingController();
  bool _obscureText = true;
  FirebaseAuthMethods firebaseAuthMethod = FirebaseAuthMethods(
    FirebaseAuth.instance,
  );

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    // fullNameController.dispose();
    super.dispose();
  }

  void signUpUser() async {
    firebaseAuthMethod.signUpMethod(
      emailController: emailController,
      passwordController: passwordController,
      // fullNameController: fullNameController,
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffbfd7ed),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sign up",
                  style: GoogleFonts.bebasNeue(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Fill all the Details",
                  style: GoogleFonts.bebasNeue(
                    fontSize: 20,
                    // fontWeight: FontWeight.bold,
                    color: Color(0xff003b73),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0xffE2EFF1),
                  ),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      label: Text('Enter Your Email'),
                      prefixIcon: Icon(Icons.email_outlined),
                      hintStyle: TextStyle(color: Color(0xff555273)),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0xffE2EFF1),
                  ),
                  child: TextField(
                    controller: passwordController,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      label: Text('Enter Your Password'),
                      prefixIcon: Icon(Icons.lock_outline),
                      hintStyle: TextStyle(color: Color(0xff555273)),
                      border: InputBorder.none,
                      //  for eye
                      suffixIcon: IconButton(
                        onPressed: _togglePasswordVisibility,
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Container(
                //   padding: EdgeInsets.symmetric(horizontal: 10),
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(30),
                //     color: Color(0xffE2EFF1),
                //   ),
                //   child: TextField(
                //     controller: fullNameController,
                //     decoration: InputDecoration(
                //       label: Text('Enter Your Full Name'),
                //       prefixIcon: Icon(Icons.person),
                //       hintStyle: TextStyle(color: Color(0xff555273)),
                //       border: InputBorder.none,
                //     ),
                //   ),
                // ),
                SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      signUpUser();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      'Sign up',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Already have an account ? ",
                      style: TextStyle(color: Color(0xff003b73), fontSize: 15),
                      children: [
                        TextSpan(
                          text: "Login",
                          style: TextStyle(
                            color: Color(0xff0074b7),
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
