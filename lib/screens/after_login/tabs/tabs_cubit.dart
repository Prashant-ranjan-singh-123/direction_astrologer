import 'package:bloc/bloc.dart';
import 'package:direction_astrologer/screens/after_login/profile/profile_page_after_login_cubit.dart';
import 'package:direction_astrologer/screens/after_login/profile/profile_ui.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'tabs_state.dart';

class TabsCubit extends Cubit<TabsState> {
  TabsCubit() : super(TabsState(0));

  void changeIndex(int index) {
    if (index != 0) {
      emit(state.copyWidth(index: 1));
    } else {
      emit(state.copyWidth(index: 0));
    }
  }

  void open_profile_page({required BuildContext context}) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => BlocProvider(
          create: (context) => ProfileScreenAfterLoginCubit(),
          child: ProfilePageAfterLogin(),
        ),
        // transitionsBuilder: (context, animation, secondaryAnimation, child) {
        //   return FadeTransition(
        //     opacity: animation,
        //     child: child,
        //   );
        // },
        // transitionDuration: Duration(milliseconds: 400), // Adjust animation speed
      ),
    );
  }
}
