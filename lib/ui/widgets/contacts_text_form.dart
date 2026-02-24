import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_styles.dart';
typedef OnChange = void Function(String);
class ContactsTextForm extends StatefulWidget{
  String hintText;
  OnChange onChange;
  TextEditingController controller;
  ContactsTextForm({super.key, required this.hintText, required this.controller,required this.onChange  });
  @override
  State<ContactsTextForm> createState() => _ContactsTextFormState();
}

class _ContactsTextFormState extends State<ContactsTextForm> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "This field is required";
        } else {
          return null;
        }
      },
      controller: widget.controller,
      onChanged: widget.onChange,
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
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: AppColors.red, width: 2)
        ),
      ),

    );
  }
}