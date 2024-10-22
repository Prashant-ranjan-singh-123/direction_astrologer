import 'package:direction_astrologer/screens/after_login/chating/chat/chat_screen_cubit.dart';
import 'package:direction_astrologer/services/shared_preferences/shared_preference_logic.dart';
import 'package:direction_astrologer/utils/app_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../screens/after_login/chating/chat_screen.dart';
import '../states/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState());

  Future<void> login({
    required String email,
    required String pass,
    required BuildContext context,
  }) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    print('email: ${email.trim()}');
    print('pass: ${pass.trim()}');
    try {
      // Optional: Sign out any previous session
      await _auth.signOut();

      // Try signing in with email and password
      UserCredential userCred = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: pass.trim(),
      );

      // Check if login is successful
      if (userCred.user != null) {
        print('User signed in: ${userCred.user!.email}');
        // Redirect to HomeScreen or desired screen
        await SharedPreferenceLogic.setLoginTrue();
        AppDialog.instance().infoDialog(
            context: context,
            title: 'Login Success',
            content: 'Welcome to our app, Login Success',
            onActionPressed: (){
              Navigator.of(context).pop(); // Close the dialog
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => BlocProvider(
                      create: (context) => ChatScreenCubit(),
                      child: ChatScreen(),
                    )),
              );
            },
          actionName: 'Get Started'
        );
      }
    } on FirebaseAuthException catch (e) {
      // Handle specific FirebaseAuth errors
      AppDialog.instance().infoDialog(
          context: context,
          title: 'Login Fail',
          content: 'Please verify id and password');
      // if (e.code == 'user-not-found') {
      //   showSnackBar(context, 'No user found for that email.');
      // } else if (e.code == 'wrong-password') {
      //   showSnackBar(context, 'Wrong password provided.');
      // } else {
      //   showSnackBar(context, 'Login failed: ${e.message}');
      // }
    } catch (e) {
      // Handle any other errors
      showSnackBar(context, 'An unexpected error occurred: $e');
    }
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
