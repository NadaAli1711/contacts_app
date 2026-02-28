import 'package:contact_app/core/utils/app_colors.dart';
import 'package:contact_app/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ContactsApp());
}

class ContactsApp extends StatelessWidget {
  const ContactsApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contacts App',
     debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.darkBlue,
        textSelectionTheme: TextSelectionThemeData(
          selectionHandleColor: AppColors.transparent,
          cursorColor: AppColors.gold,
           selectionColor:AppColors.selectionColor,

        )
      ),
    );
  }
}

