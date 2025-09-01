import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_smit/Login/Signup/signup_screen.dart';
import 'package:hackathon_smit/service/firebase_auth_method.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // for password togglevisibility
  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  //  for eye apper in password textfield
  bool _obscureText = true;
  FirebaseAuthMethods firebaseAuthMethod = FirebaseAuthMethods(
    FirebaseAuth.instance,
  );

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void loginWithEmail() async {
    firebaseAuthMethod.loginWithEmail(
      emailController: emailController,
      passwordController: passwordController,
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xffbfd7ed),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/Vector.png'),
                SizedBox(height: 10),
                Text(
                  "HealthPal",
                  style: GoogleFonts.bebasNeue(
                    fontSize: 20,
                    fontWeight: FontWeight.w100,
                    // color: Color(0xff003b73),
                  ),
                ),
                SizedBox(height: 0),
                Text(
                  "Hi, Welcome Back!",
                  style: GoogleFonts.bebasNeue(
                    fontSize: 20,
                    fontWeight: FontWeight.w100,
                    // color: Color(0xff003b73),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Hope you're doing fine. ",
                  style: TextStyle(
                    fontSize: 15,
                    // fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey[50],
                    border: Border.all(color: Colors.grey[200]!),
                  ),
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      hintText: 'Your Email',
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.grey,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey[50],
                    border: Border.all(color: Colors.grey[200]!),
                  ),
                  child: TextField(
                    controller: passwordController,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      prefixIcon: const Icon(
                        Icons.lock_outline,
                        color: Colors.grey,
                      ),
                      suffixIcon: IconButton(
                        onPressed: _togglePasswordVisibility,
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                        ),
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      loginWithEmail();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      'Sign in',
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
                      text: "Don't have an account ? ",
                      style: TextStyle(color: Color(0xff003b73), fontSize: 15),
                      children: [
                        TextSpan(
                          text: "Sign Up",
                          style: TextStyle(
                            color: Color(0xff0074b7),
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignupScreen(),
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
// import 'package:flutter/material.dart';
// import 'package:hackathon_smit/home_screen.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class Signin extends StatefulWidget {
//   @override
//   _SigninState createState() => _SigninState();
// }

// class _SigninState extends State<Signin> {
//   bool visible = false;

//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();

//   Future userLogin() async {
//     setState(() {
//       visible = true;
//     });

//     String email = emailController.text;
//     String password = passwordController.text;

//     // FakeStore Login API
//     var url = Uri.parse("https://fakestoreapi.com/auth/login");

//     // FakeStore API expects username & password (NOT email)
//     var data = {
//       "username": email, // use username here instead of email
//       "password": password,
//     };

//     try {
//       var response = await http.post(
//         url,
//         headers: {"Content-Type": "application/json"},
//         body: json.encode(data),
//       );

//       print("Status Code: ${response.statusCode}");
//       print("Response: ${response.body}");

//       if (response.statusCode == 200) {
//         var message = jsonDecode(response.body);

//         setState(() {
//           visible = false;
//         });

//         // Success → API returns a JWT token
//         if (message["token"] != null) {
//           // Navigate to home page
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => HomeScreen()),
//           );
//         } else {
//           _showErrorDialog("Login failed. Try again.");
//         }
//       } else {
//         setState(() {
//           visible = false;
//         });
//         _showErrorDialog("Invalid credentials.");
//       }
//     } catch (e) {
//       setState(() {
//         visible = false;
//       });
//       _showErrorDialog("Error: $e");
//     }
//   }

//   void _showErrorDialog(String msg) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text("Login Error"),
//         content: Text(msg),
//         actions: [
//           TextButton(
//             child: Text("OK"),
//             onPressed: () => Navigator.pop(context),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: Icon(Icons.menu),
//         title: const Text('Bdm Self Service App'),
//         centerTitle: true,
//         backgroundColor: Colors.blue,
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(30.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Center(
//               child: CircleAvatar(
//                 backgroundImage: AssetImage('assets/images/pic.jpeg'),
//                 radius: 60.0,
//               ),
//             ),
//             SizedBox(height: 10.0),
//             TextFormField(
//               controller: emailController,
//               decoration: InputDecoration(labelText: 'Enter Username'),
//             ),
//             SizedBox(height: 10.0),
//             TextFormField(
//               controller: passwordController,
//               decoration: InputDecoration(labelText: 'Enter Password'),
//               obscureText: true,
//             ),
//             SizedBox(height: 20.0),
//             ElevatedButton(
//               onPressed: userLogin,
//               child: visible
//                   ? CircularProgressIndicator(color: Colors.white)
//                   : Text('Login'),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.green,
//                 minimumSize: Size(300, 50),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(18.0),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
