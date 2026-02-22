import 'package:contact_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

import '../../core/utils/app_assets.dart';
import '../../core/utils/app_styles.dart';
import '../widgets/contacts_elevated_button.dart';
import '../widgets/contacts_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      appBar: AppBar(
        title: SvgPicture.asset(AppImages.appBarLogo),
        centerTitle: false,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Lottie.asset(AppJsons.animation),
            Text(
              'There is No Contacts Added Here',
              style: AppStyles.largeTitle,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                color: AppColors.darkBlue,
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 16,
                  children: [
                    ContactsText(text: 'User Name',),
                    ContactsText(text: 'example@email.com',),
                    Text('+200000000000',style: AppStyles.mediumTitle,),
                    ContactsElevatedButton(),
                  ],
                ),
              );
            },
          );
        },
        backgroundColor: AppColors.gold,
        child: Icon(Icons.add),
      ),
    );
  }
}
