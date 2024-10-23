import 'package:direction_astrologer/main.dart';
import 'package:direction_astrologer/screens/after_login/chating/chat/chat_screen_cubit.dart';
import 'package:direction_astrologer/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.instance().white,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Chat Screen'),
            ElevatedButton(onPressed: (){
              context.read<ChatScreenCubit>().sign_out(context: context);
            }, child: Text('Sign Out'))
          ],
        ),
      ),
    );
  }
}
