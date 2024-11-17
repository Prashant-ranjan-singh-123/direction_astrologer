import 'package:direction_astrologer/screens/splash_screen/splash_screen.dart';
import 'package:direction_astrologer/screens/splash_screen/splash_screen_cubit.dart';
import 'package:direction_astrologer/services/login_check/login_check.dart';
import 'package:direction_astrologer/services/login_check/login_check_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zego_zimkit/zego_zimkit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  ZIMKit().init(
    appID: 835939070, // your appid
    appSign: 'a97fcf34bca5ccc4d49cc9efe64d2689a105345d1f5fcbf3df8feac4f75d9297',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Direction Doctor',
        home: BlocProvider(
          create: (context) => SplashScreenCubit(),
          child: const SplashScreen(),
        ));
  }
}
