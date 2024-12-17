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
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../firebase_options_2.dart';
import '../../../../model/chat_show_model.dart';
import 'chat_screen_state.dart';

class ChatScreenCubit extends Cubit<ChatScreenState> {
  ChatScreenCubit()
      : super(ChatScreenState(
            loading: true, users: []));

  Future<FirebaseApp> initializeSecondaryApp() async {
    return await Firebase.initializeApp(
      name: 'secondaryApp',
      options: DefaultFirebaseOptionsTwo
          .currentPlatform, // Use options from DefaultFirebaseOptionsTwo
    );
  }

  void getData() async {
    emit(state.copyWith(loading: true));

    final secondaryApp = await initializeSecondaryApp();
    final firestore = FirebaseFirestore.instanceFor(app: secondaryApp);
    int? number = await SharedPreferenceLogic.get_current_model_index();
    List<ChatShowModel> users = [];

    final querySnapshot = await firestore
        .collection(model[number!]
            .firebase_id) // Collection based on the astrologer's name
        .get();

    for (var doc in querySnapshot.docs) {
      // users.add(doc.id);
      users.add(ChatShowModel(name: doc.id, image: doc.data()['image']));
      print(doc.data()['image']);
    }
    emit(state.copyWith(loading: false, users: users));
  }
}
