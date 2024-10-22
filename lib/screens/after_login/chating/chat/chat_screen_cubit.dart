import 'package:bloc/bloc.dart';
import 'package:direction_astrologer/services/login_check/login_check.dart';
import 'package:direction_astrologer/services/login_check/login_check_cubit.dart';
import 'package:direction_astrologer/services/shared_preferences/shared_preference_logic.dart';
import 'package:direction_astrologer/utils/app_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'chat_screen_state.dart';

class ChatScreenCubit extends Cubit<ChatScreenState> {
  ChatScreenCubit() : super(ChatScreenInitial());

  Future<void> sign_out({required BuildContext context}) async {
    AppDialog.instance().confDialog(
        context: context,
        title: 'Confirm Logout',
        content: 'Are you sure you want to log out?',
        onActionPressed: () async {
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
        });
  }
}
