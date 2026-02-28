import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_styles.dart';

typedef OnChange = void Function(String);
typedef Validator = String? Function(String?);

class ContactsTextForm extends StatefulWidget {
  final String hintText;
  final OnChange onChange;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String label;
  final Validator validator;

  const ContactsTextForm({
    super.key,
    required this.hintText,
    required this.controller,
    required this.onChange,
    required this.keyboardType,
    required this.label,
    required this.validator,
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
      validator: widget.validator,
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
