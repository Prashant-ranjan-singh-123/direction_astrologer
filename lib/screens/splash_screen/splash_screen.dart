import 'package:direction_astrologer/screens/splash_screen/splash_screen_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/assets.dart';
import '../../utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    context.read<SplashScreenCubit>().change_page(context: context);
  }

  @override
  Widget build(BuildContext context) {

    return OrientationBuilder(builder: (context, orientation) {
      if (orientation == Orientation.portrait) {
        return _portrate();
      } else {
        return _landscape();
      }
    });
  }

  Widget _portrate() {
    return Scaffold(
        backgroundColor: Color.fromRGBO(251, 251, 251, 1),
        body: SafeArea(
          bottom: false,
          right: false,
          left: false,
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Spacer(),
                _logo_top(),
                const SizedBox(
                  height: 15,
                ),
                _text(),
                Spacer(),
                _bottom_family_image()
              ],
            ),
          ),
        ));
  }

  Widget _landscape() {
    return Scaffold(
        backgroundColor: Color.fromRGBO(251, 251, 251, 1),
        body: SafeArea(
          bottom: false,
          right: false,
          left: false,
          child: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Builder(builder: (context) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                    );
                  }),
                  _logo_top(),
                  const SizedBox(
                    height: 15,
                  ),
                  _text(),
                  Builder(builder: (context) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                    );
                  }),
                  _bottom_family_image()
                ],
              ),
            ),
          ),
        ));
  }

  Widget _logo_top() {
    return Column(
      children: [
        SvgPicture.asset(AppAssets.instance().svg_full_logo),
        const SizedBox(
          height: 15,
        ),
        Builder(builder: (BuildContext context) {
          return SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Divider(
                color: AppColor.instance().white,
              ));
        })
      ],
    );
  }

  Widget _text() {
    return Text(
      'Get directions for your life problems',
      style: GoogleFonts.montserrat(
          fontSize: 20,
          color: AppColor.instance().text_dark_green,
          fontWeight: FontWeight.w500
      )
          // fontFamily: AppFonts.gilroy_extra_bold);,
      // style: AppTextStyle.h1().copyWith(
      //     fontFamily: AppFonts.gilroy_light, fontWeight: FontWeight.w500),
    );
  }

  Widget _bottom_family_image() {
    return Image.asset(AppAssets.instance().png_splash_family);
  }
}
