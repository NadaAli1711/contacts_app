import 'package:contact_app/core/utils/app_colors.dart';
import 'package:contact_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
typedef Onpressed = void Function();
class ContactsElevatedButton extends StatelessWidget {
  Onpressed onPressed;
  double height;
  TextStyle textStyle;
  String text;
  Color color;
  double radius;
  bool hasIcon ;

  ContactsElevatedButton({super.key, required this.onPressed,this.height = 31, this.textStyle = AppStyles.smallButtonText, this.text = 'Delete',this.color = AppColors.red,this.radius = 8,this.hasIcon = true});
  @override
  Widget build(BuildContext context) {
   return ElevatedButton(onPressed: onPressed,style: ElevatedButton.styleFrom(
     backgroundColor: color,
       tapTargetSize: MaterialTapTargetSize.shrinkWrap,
       minimumSize: Size(double.infinity, height),
     shape: RoundedRectangleBorder(
       borderRadius: BorderRadiusGeometry.circular(radius)
     )
   ), child: Row(
     spacing: 5,
     mainAxisAlignment: MainAxisAlignment.center,
     children: [
       hasIcon ? Icon(Icons.delete_rounded,color: AppColors.white,):SizedBox.shrink(),
       Text(text,style:textStyle,),
     ],
   ),);
  }
  
  
}
