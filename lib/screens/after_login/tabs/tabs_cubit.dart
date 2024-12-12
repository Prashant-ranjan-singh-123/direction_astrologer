import 'package:bloc/bloc.dart';
import 'package:direction_astrologer/screens/after_login/profile/profile_page_after_login_cubit.dart';
import 'package:direction_astrologer/screens/after_login/profile/profile_ui.dart';
import 'package:direction_astrologer/services/shared_preferences/shared_preference_logic.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'tabs_state.dart';

class TabsCubit extends Cubit<TabsState> {
  TabsCubit() : super(TabsState(0, true, -1));

  void changeIndex(int index) {
    if (index != 0) {
      emit(state.copyWidth(index: 1, loading: false));
    } else {
      emit(state.copyWidth(index: 0, loading: false));
    }
  }

  void open_profile_page({required BuildContext context}) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => BlocProvider(
          create: (context) => ProfileScreenAfterLoginCubit(),
          child: ProfilePageAfterLogin(),
        ),
      ),
    );
  }

  Future<void> get_data() async {
    emit(state.copyWidth(loading: true));

    int current_model_index =
        await SharedPreferenceLogic.get_current_model_index() ?? 0;

    emit(state.copyWidth(
        loading: false, counterModelIndex: current_model_index));

    print('State updated to loading: false');
  }
}
