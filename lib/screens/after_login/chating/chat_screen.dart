import 'package:direction_astrologer/main.dart';
import 'package:direction_astrologer/screens/after_login/chating/chat/chat_screen_cubit.dart';
import 'package:direction_astrologer/utils/assets.dart';
import 'package:direction_astrologer/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

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
          children: [_no_chat(context: context)],
        ),
      ),
    );
  }

  Widget _no_chat({required BuildContext context}) {
    return Column(
      children: [
        SizedBox(
            width: MediaQuery.sizeOf(context).width*0.5,
            child: SvgPicture.asset(AppAssets.instance().svg_empty_chat)),
        Text(
          'No Chats Available',
          style: GoogleFonts.montserrat(
              fontSize: 20, color: AppColor.instance().black,
              fontWeight: FontWeight.w600
          ),

        )
      ],
    );
  }
}
