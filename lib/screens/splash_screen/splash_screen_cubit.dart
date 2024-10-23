import 'package:direction_astrologer/screens/splash_screen/splash_screen_state.dart';
import 'package:direction_astrologer/services/login_check/login_check.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/login_check/login_check_cubit.dart';
import '../../services/shared_preferences/shared_preference_logic.dart';

class SplashScreenCubit extends Cubit<SplashScreenState> {
  SplashScreenCubit() : super(SplashScreenState(loading: true));

  void change_page({required BuildContext context}) {
    emit(state.copyWith(loading: false));
    Future.delayed(Duration(seconds: 2)).then((_) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => BlocProvider(
                create: (context) => LoginCheckCubit(),
                child: LoginCheck(),
              )));

      // Navigator.of(context).pushReplacement(
      //     MaterialPageRoute(builder: (context) => BottomNavBarMain()));
    });
  }
}
