import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  bool loading;
  LoginState({required this.loading});

  LoginState copyWith({
    bool? loading,
  }) {
    return LoginState(loading: loading ?? this.loading);
  }

  @override
  List<Object?> get props => [loading];
}
