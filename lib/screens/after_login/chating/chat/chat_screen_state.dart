import 'package:equatable/equatable.dart';

import '../../../../model/chat_show_model.dart';

class ChatScreenState extends Equatable {
  bool loading;
  List<ChatShowModel> users;
  ChatScreenState(
      {required this.loading,
      required this.users,});

  ChatScreenState copyWith({
    bool? loading,
    List<ChatShowModel>? users,
  }) {
    return ChatScreenState(
        loading: loading ?? this.loading,
        users: users ?? this.users);
  }

  @override
  List<Object?> get props => [loading, users];
}
