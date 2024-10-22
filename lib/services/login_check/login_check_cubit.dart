import 'package:direction_astrologer/services/login_check/login_check_state.dart';
import 'package:direction_astrologer/services/shared_preferences/shared_preference_logic.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginCheckCubit extends Cubit<LoginCheckState>{
  LoginCheckCubit() : super(LoginCheckState(true, null));

  Future<void> token_check_logic() async {
    // await SharedPreferenceLogic.setLoginFalse();
    // await SharedPreferenceLogic.setLoginTrue();
    bool is_login = await SharedPreferenceLogic.isLogIn();
    if(is_login){
      emit(state.copyWith(loading: false, is_token: true));
    }else{
      emit(state.copyWith(loading: false, is_token: false));
    }
  }
}