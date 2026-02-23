import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_styles.dart';

class ContactsTextForm extends StatefulWidget{
  String hintText;
  TextEditingController controller;
  ContactsTextForm({super.key, required this.hintText, required this.controller});

  @override
  State<ContactsTextForm> createState() => _ContactsTextFormState();
}

class _ContactsTextFormState extends State<ContactsTextForm> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
       controller: widget.controller,
      onChanged: (s) => setState(() {}),
      style: AppStyles.mediumTitle,
      cursorColor: AppColors.gold,
      autocorrect: true,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintStyle: AppStyles.hintStyle,
        hintText: widget.hintText,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: AppColors.gold)
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: AppColors.gold)
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: AppColors.gold,width: 2)
        ),
      ),

    );
  }
}