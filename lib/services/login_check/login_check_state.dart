import 'package:equatable/equatable.dart';

class LoginCheckState extends Equatable {
  bool loading;
  bool? is_token;

  LoginCheckState(this.loading, this.is_token);

  LoginCheckState copyWith({bool loading = true, bool? is_token = null}) {
    return LoginCheckState(loading ?? this.loading, is_token ?? this.is_token);
  }

  @override
  List<Object?> get props => [loading, is_token];
}
