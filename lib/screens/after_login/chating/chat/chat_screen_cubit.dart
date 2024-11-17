import 'package:bloc/bloc.dart';
import 'package:direction_astrologer/model/email_model.dart';
import 'package:direction_astrologer/services/login_check/login_check.dart';
import 'package:direction_astrologer/services/login_check/login_check_cubit.dart';
import 'package:direction_astrologer/services/shared_preferences/shared_preference_logic.dart';
import 'package:direction_astrologer/utils/app_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zego_zimkit/zego_zimkit.dart';

import 'chat_screen_state.dart';

class ChatScreenCubit extends Cubit<ChatScreenState> {
  ChatScreenCubit() : super(ChatScreenState(loading: true, email: null));
  Future<void> getData() async {
    emit(state.copyWith(loading: true));
    var email = await SharedPreferenceLogic.getEmail();
    var name;
    for(var items in model){
      if(items.email==email){
        name = items.userName;
        break;
      }
    }

    try {
      await ZIMKit()
          .connectUser(id: email!, name: name);
    } catch (e){
      print('Exception tagda vaala: $e');
    }
    emit(state.copyWith(loading: false, email: email));
  }
}
