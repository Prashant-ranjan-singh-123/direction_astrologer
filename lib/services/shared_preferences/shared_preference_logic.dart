import 'package:direction_astrologer/services/shared_preferences/shared_preference_const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceLogic{
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
  }

  static Future<void> setLoginTrue() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool(AppSharedPreferenceConst.instance().isLogin, true);
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