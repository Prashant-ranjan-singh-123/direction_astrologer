import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tabs_state.dart';

class TabsCubit extends Cubit<TabsState> {
  TabsCubit() : super(TabsState(0));

  void changeIndex(int index){
    if(index!=0){
      emit(state.copyWidth(index: 1));
    }else{
      emit(state.copyWidth(index: 0));
    }
  }
}
