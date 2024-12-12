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
import 'chat_screen_state.dart';

class ChatScreenCubit extends Cubit<ChatScreenState> {
  ChatScreenCubit() : super(ChatScreenState(loading: true, email: null));

  Future<FirebaseApp> initializeSecondaryApp() async {
    return await Firebase.initializeApp(
      name: 'secondaryApp',
      options: DefaultFirebaseOptionsTwo.currentPlatform, // Use options from DefaultFirebaseOptionsTwo
    );
  }

  Future<void> getData() async {
    final secondaryApp = await initializeSecondaryApp();
    final firestore = FirebaseFirestore.instanceFor(app: secondaryApp);

    // final snapshot = await firestore.collection('Father Daniel Jones').get();
    // for (var doc in snapshot.docs) {
    //   print('${doc.id}: ${doc.data()}');
    // }

    final querySnapshot = await firestore
        .collection('Father Daniel Jones') // Main collection
        .doc('PRASHANT RANJAN SINGH')      // Specific document for the user
        .collection('messages')            // Sub-collection for messages
        .orderBy('timestamp', descending: true) // Order by timestamp
        .get();                            // Execute the query to get results

    // Print each message document
    for (var doc in querySnapshot.docs) {
      print('${doc.id}: ${doc.data()}');
    }

    // emit(state.copyWith(loading: true));
    // var email = await SharedPreferenceLogic.getEmail();
    // var name;
    // for(var items in model){
    //   if(items.email==email){
    //     name = items.userName;
    //     break;
    //   }
    // }
    //
    // try {
    //   await ZIMKit()
    //       .connectUser(id: email!, name: name);
    // } catch (e){
    //   print('Exception tagda vaala: $e');
    // }
    // emit(state.copyWith(loading: false, email: email));
  }
}
