import 'package:contact_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import '../../core/utils/app_styles.dart';

class ContactsText extends StatelessWidget {
  TextEditingController textController;
  String hintText;
  ContactsText({
    super.key,
    required this.textController,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 16),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.gold)),
      ),
      child: Text(
        textController.text.isEmpty ? hintText : textController.text,
        style: AppStyles.mediumTitle,
      ),
    );
  }
}
