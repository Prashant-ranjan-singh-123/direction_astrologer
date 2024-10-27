import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../utils/assets.dart';
import '../../../utils/colors.dart';

class CallingScreen extends StatelessWidget {
  const CallingScreen({super.key});

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
            child: SvgPicture.asset(AppAssets.instance().svg_empty_call)),
        Text(
          'No Call Records',
          style: GoogleFonts.montserrat(
              fontSize: 20, color: AppColor.instance().black,
              fontWeight: FontWeight.w600
          ),

        )
      ],
    );
  }
}
