import 'package:direction_astrologer/screens/after_login/chating/chat/chat_screen_cubit.dart';
import 'package:direction_astrologer/screens/after_login/tabs/tab_ui.dart';
import 'package:direction_astrologer/screens/after_login/tabs/tabs_cubit.dart';
import 'package:direction_astrologer/screens/before_login/login_screen.dart';
import 'package:direction_astrologer/services/login_check/login_check_cubit.dart';
import 'package:direction_astrologer/services/login_check/login_check_state.dart';
import 'package:direction_astrologer/services/shared_preferences/shared_preference_logic.dart';
import 'package:direction_astrologer/state_management/bloc/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../screens/after_login/chating/chat_screen.dart';

class LoginCheck extends StatefulWidget {
  const LoginCheck({super.key});

  @override
  State<LoginCheck> createState() => _LoginCheckState();
}

class _LoginCheckState extends State<LoginCheck> {
  @override
  void initState() {
    context.read<LoginCheckCubit>().token_check_logic();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCheckCubit, LoginCheckState>(
      builder: (context, state) {
        bool loading = state.loading;
        bool? isToken = state.is_token;
        if (loading || isToken == null) {
          return _loading();
        } else if (isToken) {
          return _token();
        } else {
          return _no_token();
        }
      },
    );
  }

  Widget _loading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _token() {
    return BlocProvider(
      create: (context) => TabsCubit(),
      child: TabUi(),
    );
  }

  Widget _no_token() {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: const LoginScreen(),
    );
  }
}
