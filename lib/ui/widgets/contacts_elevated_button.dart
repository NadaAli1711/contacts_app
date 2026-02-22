import 'package:contact_app/core/utils/app_colors.dart';
import 'package:contact_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ContactsElevatedButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return ElevatedButton(onPressed: () {  },style: ElevatedButton.styleFrom(
     backgroundColor: AppColors.gold,
       minimumSize: const Size(double.infinity, 60),
     shape: RoundedRectangleBorder(
       borderRadius: BorderRadiusGeometry.circular(16)
     )
   ), child: Text('Enter user',style: AppStyles.buttonText,),);
  }
  
  
}
