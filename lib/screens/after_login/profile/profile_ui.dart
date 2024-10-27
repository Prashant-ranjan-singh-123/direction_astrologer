import 'package:cached_network_image/cached_network_image.dart';
import 'package:direction_astrologer/screens/after_login/profile/profile_page_after_login_cubit.dart';
import 'package:direction_astrologer/screens/after_login/profile/profile_screen_after_login_state.dart';
import 'package:direction_astrologer/utils/app_constants.dart';
import 'package:direction_astrologer/utils/assets.dart';
import 'package:direction_astrologer/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePageAfterLogin extends StatefulWidget {
  const ProfilePageAfterLogin({super.key});

  @override
  State<ProfilePageAfterLogin> createState() => _ProfilePageAfterLoginState();
}

class _ProfilePageAfterLoginState extends State<ProfilePageAfterLogin> {
  late ProfileScreenAfterLoginCubit profileScreenAfterLoginCubit;
  late List<String?> data;

  @override
  void initState() {
    profileScreenAfterLoginCubit = context.read<ProfileScreenAfterLoginCubit>();
    setData();
    setState(() {});
    super.initState();
  }

  Future<void> setData() async {
    context.read<ProfileScreenAfterLoginCubit>().setData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.instance().header_light_green_original,
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back),
          ),
          title: Text(
            'My Profile',
            style: GoogleFonts.montserrat(
                color: AppColor.instance().text_dark_green,
                fontWeight: FontWeight.w700,
                fontSize: 18),
          ),
          centerTitle: true,
          leadingWidth: 80,
        ),
        body: BlocBuilder<ProfileScreenAfterLoginCubit,
            ProfileScreenAfterLoginState>(builder: (context, state) {
          bool loading = state.loading;
          return loading
              ? Center(
                  child: CircularProgressIndicator.adaptive(
                    backgroundColor: AppColor.instance().header_light_green,
                  ),
                )
              : SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      _profile_photo(state: state),
                      _profile_buttons(
                          logoString: AppAssets.instance().svg_shield,
                          name: 'Privacy Policy',
                          fun: () {
                            profileScreenAfterLoginCubit.click_privacy_policy();
                          }),
                      _profile_buttons(
                          logoString: AppAssets.instance().svg_log_out,
                          name: 'Log Out',
                          fun: () => profileScreenAfterLoginCubit.click_log_out(
                              context: context)),
                      _build_chat_support(context: context)
                    ],
                  ),
                );
        }));
  }

  Widget _build_chat_support({required BuildContext context}) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Divider(
            color: AppColor.instance().shadow2,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'You want any help?',
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600, fontSize: 18),
                // style: AppTextStyle.h1(fontColor: AppColor.font_black),
              ),
              Text(
                'We’ve got you covered, Chat with us on Whatsapp right now and get helped!',
                style: GoogleFonts.montserrat(
                    color: AppColor.instance().black,
                    fontWeight: FontWeight.w400,
                    fontSize: 13),
              ),
              SizedBox(
                height: 15,
              ),
              AspectRatio(
                aspectRatio: 16 / 2,
                child: ElevatedButton(
                    onPressed: () async {
                      profileScreenAfterLoginCubit.click_chat_support();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.instance().button_color,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(AppAssets.instance().svg_whatsapp),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Chat Support',
                          style: GoogleFonts.montserrat(
                              color: AppColor.instance().white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                          // style: AppTextStyle.h1(
                          //     fontSize: 16, fontColor: AppColor.white),
                        ),
                      ],
                    )),
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _profile_buttons(
      {required String logoString,
      required String name,
      required Function fun}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextButton(
        style: TextButton.styleFrom(
          splashFactory: NoSplash.splashFactory,
          overlayColor: AppColor.instance().button_color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () => fun(),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(logoString),
            const SizedBox(width: 20),
            Expanded(
              child: SizedBox(
                child: Text(
                  name,
                  style: GoogleFonts.montserrat(
                      color: AppColor.instance().black,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Icon(
              Icons.arrow_forward_ios,
              size: 15,
              color: AppColor.instance().black,
            )
          ],
        ),
      ),
    );
  }

  Widget _profile_photo({required ProfileScreenAfterLoginState state}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.03),
      child: Column(
        children: [
          Hero(
            tag: AppConstants.instance().heroPhofilePhoto,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.33,
              height: MediaQuery.of(context).size.width * 0.33,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black), // Border color
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.width * 0.33),
                child: Container(
                  child: state.photo == null
                      ? Image.asset(
                          AppAssets.instance().png_doctor_one,
                          fit: BoxFit
                              .cover, // Use BoxFit.cover to ensure it fills the circle
                        )
                      : CachedNetworkImage(
                          imageUrl: state.photo!,
                          fit: BoxFit.cover,
                          progressIndicatorBuilder: (context, url, progress) =>
                              Center(
                            child: CircularProgressIndicator.adaptive(
                              backgroundColor: AppColor.instance()
                                  .header_light_green_original,
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              SvgPicture.asset(
                            AppAssets.instance().svg_only_brand_logo,
                            fit: BoxFit
                                .contain, // Use BoxFit.cover to ensure it fills the circle
                          ),
                        ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Text(
            state.name,
            style: GoogleFonts.montserrat(
                color: AppColor.instance().black,
                fontSize: 20,
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
