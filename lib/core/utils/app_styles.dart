import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppStyles {
  static const TextStyle largeTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: AppColors.gold
  );
  static const TextStyle buttonText = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: AppColors.darkBlue
  );
  static const TextStyle mediumTitle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.gold
  );
  static const TextStyle hintStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.gold
  );
  static const TextStyle smallBody = TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: AppColors.darkBlue
  );
  static const TextStyle smallButtonText = TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: AppColors.white
  );
}