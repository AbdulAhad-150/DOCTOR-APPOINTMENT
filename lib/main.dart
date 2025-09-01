import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_smit/Login/Signup/login_screen.dart';
import 'package:hackathon_smit/firebase_options.dart';
import 'package:hackathon_smit/home_screen.dart';
import 'package:hackathon_smit/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: AuthWrapper());
  }
}

/// This widget decides whether to show HomeScreen or LoginScreen
class AuthWrapper extends StatefulWidget {
  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show loading indicator while checking auth state
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasData) {
            //  User is logged in → go to HomePage
            return const HomeScreen();
          } else {
            // User not logged in → go to onboarding/login
            return SplashScreen();
            // return LoginScreen();
            // return HomeScreen();
          }
        },
      ),
    );
  }
}
