import 'package:contact_app/core/utils/app_colors.dart';
import 'package:contact_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ContactsElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double buttonHeight;
  final TextStyle textStyle;
  final String text;
  final Color color;
  final double radius;
  final bool hasIcon;

  const ContactsElevatedButton({
    super.key,
    required this.onPressed,
    this.buttonHeight = 31,
    this.textStyle = AppStyles.white10Medium,
    this.text = 'Delete',
    this.color = AppColors.red,
    this.radius = 8,
    this.hasIcon = true,
  });
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    double designWidth = 402;
    var height = MediaQuery.of(context).size.height;
    double designHeight = 874;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: Size(double.infinity, (buttonHeight/designHeight)*height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular((radius/designWidth)*width),
        ),
      ),
      child: Row(
        spacing: (5/designWidth)*width,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          hasIcon
              ? Icon(Icons.delete_rounded, color: AppColors.white)
              : SizedBox(),
          Text(text, style: textStyle),
        ],
      ),
    );
  }
}
