import 'package:direction_astrologer/services/shared_preferences/shared_preference_const.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/email_model.dart';

class SharedPreferenceLogic {
  static Future<bool> isLogIn() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool? isLogIn = pref.getBool(AppSharedPreferenceConst.instance().isLogin);
    if (isLogIn == null) {
      pref.setBool(AppSharedPreferenceConst.instance().isLogin, false);
      return false;
    } else {
      return isLogIn;
    }
  }

  static Future<void> setLoginFalse() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool(AppSharedPreferenceConst.instance().isLogin, false);
    pref.remove(AppSharedPreferenceConst.instance().isLogin);
    pref.setInt(AppSharedPreferenceConst.instance().current_model_index, -1);
  }

  static Future<void> setLoginTrue({required String email}) async {
    int index = -1;
    for (int i = 0; i < model.length; ++i) {
      if (model[i].email == email.toLowerCase().trim()) {
        index = i;
        break;
      }
    }
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(AppSharedPreferenceConst.instance().email, email);
    pref.setInt(AppSharedPreferenceConst.instance().current_model_index, index);
    pref.setBool(AppSharedPreferenceConst.instance().isLogin, true);
  }

  static Future<String?> getEmail() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? email = pref.getString(AppSharedPreferenceConst.instance().email);
    return email;
  }

  static Future<int?> get_current_model_index() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int? current_model_index =
        pref.getInt(AppSharedPreferenceConst.instance().current_model_index);
    return current_model_index;
  }

  // static Future<bool> isfreshInstall() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   bool? isfreshInstal = pref.getBool(AppSharedPreference.firstInstall);
  //
  //   if(isfreshInstal==null){
  //     await pref.setBool(AppSharedPreference.firstInstall, false);
  //     return true;
  //   } else if(isfreshInstal){
  //     await pref.setBool(AppSharedPreference.firstInstall, false);
  //     return true;
  //   }else{
  //     await pref.setBool(AppSharedPreference.firstInstall, false);
  //     return true;
  //   }
  // }
}
