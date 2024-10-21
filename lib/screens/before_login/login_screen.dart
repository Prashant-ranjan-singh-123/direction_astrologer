import 'package:direction_astrologer/utils/assets.dart';
import 'package:direction_astrologer/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColor.instance().background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            decoration: BoxDecoration(
                color: AppColor.instance().white,
                border: Border.all(color: AppColor.instance().shadow)),
            width: width,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _logo(),
                  _padding_beteen_widget(small: false),
                  _name(),
                  _padding_beteen_widget(),
                  _padding_beteen_widget(),
                  _form_field(),
                  _padding_beteen_widget(small: false),
                  _submit_button(width: width, height: height),
                  _padding_beteen_widget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _logo() {
    return SvgPicture.asset(AppAssets.instance().svg_full_logo);
  }

  Widget _name() {
    return Column(
      children: [
        Text(
          'Pastor Login',
          style: GoogleFonts.montserrat(
              color: AppColor.instance().text_dark_green,
              fontSize: 35,
              fontWeight: FontWeight.w600),
        ),
        _padding_beteen_widget(),
        Text(
          'Enter username and Password Given to you to access this!',
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
              color: AppColor.instance().text_dark_green,
              fontSize: 15,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _form_field() {
    TextFormField field({required String hintText}) {
      return TextFormField(
        decoration: InputDecoration(
            hintText: hintText,
            // labelText: hintText,
            labelStyle: GoogleFonts.montserrat(
                color: AppColor.instance().shadow,
                fontSize: 15,
                fontWeight: FontWeight.w500),
            hintStyle: GoogleFonts.montserrat(
                color: AppColor.instance().shadow,
                fontSize: 15,
                fontWeight: FontWeight.w500),
            enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppColor.instance().shadow, width: 1)),
            border: OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppColor.instance().shadow, width: 0.2)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: AppColor.instance().button_color, width: 2)),
            errorBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppColor.instance().error, width: 2))),
      );
    }

    return Form(
      child: Column(
        children: [
          field(hintText: 'Username'),
          _padding_beteen_widget(),
          field(hintText: 'Password'),
        ],
      ),
    );
  }

  Widget _padding_beteen_widget({bool small = true}) {
    return SizedBox(
      height: small
          ? MediaQuery.of(context).size.height * 0.01
          : MediaQuery.of(context).size.height * 0.05,
    );
  }

  Widget _submit_button({required double width, required double height}) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.instance().button_color,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7))),
          onPressed: () {},
          child: Text(
            'Continue',
            style: GoogleFonts.montserrat(
                color: AppColor.instance().white,
                fontSize: 18,
                fontWeight: FontWeight.w500),
          )),
    );
  }
}
