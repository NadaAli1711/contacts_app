import 'package:contact_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../core/utils/app_styles.dart';

class ContactsText extends StatelessWidget{
  String text;
  ContactsText({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: AppColors.gold,
                  width: 2
              )
          )
      ),
      child: Text(text, style: AppStyles.mediumTitle),
    );
  }
}