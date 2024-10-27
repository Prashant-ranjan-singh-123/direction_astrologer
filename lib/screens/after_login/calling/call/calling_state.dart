part of 'calling_cubit.dart';

sealed class CallingState extends Equatable {
  const CallingState();
}

final class CallingInitial extends CallingState {
  @override
  List<Object> get props => [];
}
