import 'package:cached_network_image/cached_network_image.dart';
import 'package:direction_astrologer/screens/after_login/chating/chat/chat_screen_cubit.dart';
import 'package:direction_astrologer/screens/after_login/chating/chat/chat_screen_state.dart';
import 'package:direction_astrologer/utils/assets.dart';
import 'package:direction_astrologer/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

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
          // email = state.email;
          print(isLoading);
          return isLoading
              ? Center(
                  child: CircularProgressIndicator.adaptive(
                    backgroundColor: AppColor.instance().header_light_green,
                  ),
                )
              : _chat_screen_firebase(state: state);
        },
      ),
    );
  }

  Widget _no_chat(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Column(
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
      ),
    );
  }

  // Widget _chat_screen() {
  //   return ZIMKitConversationListView(
  //     emptyBuilder: _no_chat,
  //     onPressed: (context, conversation, defaultAction) {
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) {
  //             return ZIMKitMessageListPage(
  //               conversationID: conversation.id,
  //               conversationType: conversation.type,
  //             );
  //           },
  //         ),
  //       );
  //     },
  //   );
  // }

  Widget _chat_screen_firebase({required ChatScreenState state}) {
    if (state.users.length == 0) {
      return _no_chat(context);
    }
    return ListView.builder(
      itemCount: state.users.length,
      itemBuilder: (context, index) {
        return Card(
          color: AppColor.instance().white,
          elevation: 3,
          shadowColor: AppColor.instance().header_light_green_original,
          child: InkWell(
            onTap: () {
              print('User tapped: ${state.users[index]}');
            },
            splashColor: AppColor.instance()
                .header_light_green_original
                .withOpacity(0.3),
            borderRadius: BorderRadius.circular(4),
            child: ListTile(
              leading: _profile_photo(image_url: state.users[index].image),
              title: Text(state.users[index].name),
              trailing: Icon(
                Iconsax.message,
                size: 25,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _profile_photo({required String image_url}) {
    return Container(
      width: 45, // Adjust width for the desired size
      height: 45, // Adjust height for the desired size
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
            color: AppColor.instance().header_light_green_original,
            width: 1), // Optional: Border width
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
            30),
        child: image_url.isEmpty
            ? Icon(
                Iconsax.user_octagon,
                color: Colors.black,
                size: 30, // Adjust icon size
              )
            : CachedNetworkImage(
                imageUrl: image_url,
                fit: BoxFit.cover,
                progressIndicatorBuilder: (context, url, progress) => Center(
                  child: CircularProgressIndicator.adaptive(
                    backgroundColor:
                        AppColor.instance().header_light_green_original,
                  ),
                ),
                errorWidget: (context, url, error) => Icon(
                  Iconsax.user_octagon,
                  color: Colors.black,
                  size: 30, // Adjust icon size for the error case
                ),
              ),
      ),
    );
  }
}
