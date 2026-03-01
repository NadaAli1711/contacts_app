import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppStyles {
  static const TextStyle gold20Medium = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: AppColors.gold
  );
  static const TextStyle darkBlue20Regular = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: AppColors.darkBlue
  );
  static const TextStyle gold16Medium = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.gold
  );
  static const TextStyle gold16Regular = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.gold
  );
  static const TextStyle darkBlue10Medium = TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: AppColors.darkBlue
  );
  static const TextStyle white10Medium = TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: AppColors.white
  );
  static const TextStyle red10Medium = TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: AppColors.red
  );
}