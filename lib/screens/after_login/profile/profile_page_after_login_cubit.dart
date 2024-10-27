import 'package:direction_astrologer/services/app_opener.dart';
import 'package:direction_astrologer/services/login_check/login_check.dart';
import 'package:direction_astrologer/services/login_check/login_check_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../services/shared_preferences/shared_preference_logic.dart';
import 'profile_screen_after_login_state.dart';

class ProfileScreenAfterLoginCubit extends Cubit<ProfileScreenAfterLoginState> {
  ProfileScreenAfterLoginCubit()
      : super(ProfileScreenAfterLoginState(loading: true));

  Future<void> click_log_out({required BuildContext context}) async {
    confirm_logout(context: context);
  }

  void click_privacy_policy() {
    AppOpener.launchPrivacyPolicy();
  }

  Future<void> click_chat_support() async {
    await AppOpener.launchAppUsingUrl(
        link:
        'https://wa.me/+917993478539?text=Hey,%20I%20downloaded%20direction%20-%20I%20am%20having%20a%20problem');
  }

  Future<void> setData() async {
    emit(state.copyWith(loading: true));

    final result = await Future.wait([
      // AppUserDataLogic.get_image_url(),
      // AppUserDataLogic.get_name(),
    ]);

    // String? image = result[0];
    // String? name = result[1];

    // if (name != null) {
    //   emit(state.copyWith(loading: false, name: name, photo: image));
    // } else {
    emit(
        state.copyWith(loading: false, name: 'Sagar Dattatrey', photo: null));
  }

  void confirm_logout({required BuildContext context}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog.adaptive(
          title: Text('Confirm Logout'),
          content: Text('Are you sure you want to log out?'),
          actions: [
            TextButton(
              style:
              TextButton.styleFrom(splashFactory: NoSplash.splashFactory),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.black),
              ),
            ),
            TextButton(
              style:
              TextButton.styleFrom(splashFactory: NoSplash.splashFactory),
              onPressed: () async {
                Navigator.of(context).pop(); // Close the dialog
                await _sign_out_logic(context: context);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          BlocProvider(
                            create: (context) => LoginCheckCubit(),
                            child: LoginCheck(),
                          )), // Directly instantiate the screen
                      (Route<dynamic> route) =>
                  false, // This removes all previous routes
                );
              },
              child: Text(
                'Logout',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _sign_out_logic({required BuildContext context}) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    await _auth.signOut();
    await SharedPreferenceLogic.setLoginFalse();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => LoginCheckCubit(),
              child: LoginCheck(),
            )),
            (Route<dynamic> route) => false);
  }
}
