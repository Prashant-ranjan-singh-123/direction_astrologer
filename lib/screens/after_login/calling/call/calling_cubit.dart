import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'calling_state.dart';

class CallingCubit extends Cubit<CallingState> {
  CallingCubit() : super(CallingInitial());
}
