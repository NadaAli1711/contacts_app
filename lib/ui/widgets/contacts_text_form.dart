import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_styles.dart';

typedef OnChange = void Function(String);

class ContactsTextForm extends StatefulWidget {
  final String hintText;
  final OnChange onChange;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String label;

  const ContactsTextForm({
    super.key,
    required this.hintText,
    required this.controller,
    required this.onChange,
    required this.keyboardType,
    required this.label,
  });
  @override
  State<ContactsTextForm> createState() => _ContactsTextFormState();
}

class _ContactsTextFormState extends State<ContactsTextForm> {
  @override
  Widget build(BuildContext context) {

    return TextFormField(
      autovalidateMode: AutovalidateMode.onUnfocus,
      inputFormatters: widget.label == 'phone'
          ? [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(11),
            ]
          : null,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "This field is required";
        }
        if (widget.label == 'email') {
          if (!value.contains('@') || !value.endsWith('.com')) {
            return "Enter a valid email for example name@example.com";
          }
        } else if (widget.label == 'phone') {
          if (!value.startsWith('01')) {
            return "Phone must start with 01";
          }
          if (value.length != 11) {
            return "Phone must be exactly 11 digits";
          }
        }

        return null;
      },
      controller: widget.controller,
      onChanged: widget.onChange,
      style: AppStyles.gold16Medium,
      cursorColor: AppColors.gold,
      autocorrect: true,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        hintStyle: AppStyles.gold16Regular,
        hintText: widget.hintText,
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(borderWidth: 2),
        errorBorder: buildBorder(color: AppColors.red, borderWidth: 2),
      ),
    );
  }
  OutlineInputBorder buildBorder({double borderWidth= 1, Color color = AppColors.gold}){
    var width = MediaQuery.of(context).size.width;
    double designWidth = 402;
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular((16/designWidth)*width),
      borderSide: BorderSide(color: color, width: (borderWidth/designWidth)*width),
    );
  }
}
