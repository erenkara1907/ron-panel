import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ronventory_mobile/app/general/color/app_colors.dart';

class AppTextStyle {
  var kTextStyleWithFont = GoogleFonts.montserrat();

  var kTextStyleFourteenWithThemeColor = GoogleFonts.montserrat(
    fontSize: 14,color: AppColors().kAppBarTextColor,
  );

  var kTextStyleSignOut = GoogleFonts.montserrat(
    fontSize: 12, color: AppColors().kLabelColor,
  );

  var kTextStyleWelcomeName = GoogleFonts.montserrat(
    fontSize: 13, color:  AppColors().kLabelColor, fontWeight: FontWeight.w700
  );

  var kTextStyleTwelveWithWhiteColor = GoogleFonts.montserrat(
    fontSize: 12, color: AppColors().kSecondaryColor,
  );

  var kTextStyleHeader = GoogleFonts.montserrat(
    fontSize: 18, color: AppColors().kSecondaryColor, fontWeight: FontWeight.w600
  );

  var kTextStyleEmail = GoogleFonts.montserrat(
    fontSize: 12, color: AppColors().kLabelColor,
  );
}