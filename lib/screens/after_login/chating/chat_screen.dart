import 'package:direction_astrologer/main.dart';
import 'package:direction_astrologer/screens/after_login/chating/chat/chat_screen_cubit.dart';
import 'package:direction_astrologer/screens/after_login/chating/chat/chat_screen_state.dart';
import 'package:direction_astrologer/utils/assets.dart';
import 'package:direction_astrologer/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zego_zimkit/zego_zimkit.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    context.read<ChatScreenCubit>().getData();
    super.initState();
  }

  late bool isLoading;
  late String? email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.instance().white,
      body: BlocBuilder<ChatScreenCubit, ChatScreenState>(
        builder: (context, state) {
          isLoading = state.loading;
          email = state.email;
          return isLoading
              ? Center(
                  child: CircularProgressIndicator.adaptive(
                    backgroundColor: AppColor.instance().header_light_green,
                  ),
                )
              : SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: _chat_screen(),
                );
        },
      ),
    );
  }

  Widget _no_chat(BuildContext context, Widget defaultWidget) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.5,
            child: SvgPicture.asset(AppAssets.instance().svg_empty_chat)),
        Text(
          'No Chats Available',
          style: GoogleFonts.montserrat(
              fontSize: 20,
              color: AppColor.instance().black,
              fontWeight: FontWeight.w600),
        )
      ],
    );
  }

  Widget _chat_screen(){
    return ZIMKitConversationListView(
      emptyBuilder: _no_chat,
      onPressed: (context, conversation, defaultAction) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ZIMKitMessageListPage(
                conversationID: conversation.id,
                conversationType: conversation.type,
              );
            },
          ),
        );
      },
    );
  }
}
