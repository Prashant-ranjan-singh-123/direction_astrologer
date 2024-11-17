import 'package:equatable/equatable.dart';

class ChatScreenState extends Equatable {
  bool loading;
  String? email;
  ChatScreenState({required this.loading, required this.email});

  ChatScreenState copyWith({
    bool? loading,
    email,
  }) {
    return ChatScreenState(
        loading: loading ?? this.loading, email: email ?? this.email);
  }

  @override
  List<Object?> get props => [loading];
}
