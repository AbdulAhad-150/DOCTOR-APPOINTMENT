// ignore_for_file: use_build_context_synchronously, duplicate_ignore

// import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_smit/home_screen.dart';

class FirebaseAuthMethods {
  final FirebaseAuth auth;
  FirebaseAuthMethods(this.auth);

  // Show alert dialog
  void _showAlert(
    BuildContext context,
    String message, {
    VoidCallback? onClose,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Alert"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              if (onClose != null) onClose();
            },
            child: const Text("Close"),
          ),
        ],
      ),
    );
  }

  Future<void> saveUserData(
    String fullName,
    String email,
    int phoneNumber,
  ) async {
    User? user = auth.currentUser;
    if (user != null) {
      await FirebaseFirestore.instance.collection("users").doc(user.uid).set({
        "fullName": fullName,
        "email": email,
        "phoneNumber": phoneNumber,
        "createdAt": FieldValue.serverTimestamp(),
      }, SetOptions(merge: true)); // prevents overwrite
    }
  }

  // 🔹 SIGN UP with email & password
  Future<void> signUpMethod({
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required TextEditingController fullNameController,
    required TextEditingController phoneNumberController,
    required BuildContext context,
    // required TextEditingController usernameController,
    // required  phoneController,
  }) async {
    try {
      UserCredential cred = await auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      User? user = cred.user;

      if (user != null) {
        // Save user data to Firestore using UID as docId
        await FirebaseFirestore.instance.collection("users").doc(user.uid).set({
          "fullName": fullNameController.text.trim(),
          // "username": usernameController.text.trim(),
          "email": emailController.text.trim(),
          "phone": phoneNumberController.text.trim(),
          "createdAt": FieldValue.serverTimestamp(),
        });
      }

      _showAlert(
        context,
        "Account created successfully!",
        onClose: () {
          emailController.clear();
          passwordController.clear();
          phoneNumberController.clear();
          fullNameController.clear();
        },
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        _showAlert(context, "Password is too weak (min 6 characters).");
      } else if (e.code == 'email-already-in-use') {
        _showAlert(context, "This email is already registered.");
      }
    } catch (e) {
      _showAlert(context, "Something went wrong: $e");
    }
  }

  // 🔹 LOGIN with email & password
  Future<void> loginWithEmail({
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required BuildContext context,
  }) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        _showAlert(context, "No user found for that email.");
      } else if (e.code == 'wrong-password') {
        _showAlert(context, "Wrong password for this account.");
      }
    } catch (e) {
      _showAlert(context, "Something went wrong: $e");
    }
  }

  // 🔹 LOGOUT
  Future<void> signOut() async {
    await auth.signOut();
  }
}
