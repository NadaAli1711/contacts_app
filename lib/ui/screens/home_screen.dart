import 'package:contact_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

import '../../core/utils/app_assets.dart';
import '../../core/utils/app_styles.dart';
import '../widgets/contacts_elevated_button.dart';
import '../widgets/contacts_text.dart';
import '../widgets/contacts_text_form.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController textController = TextEditingController();
  final TextEditingController phontController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
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
              return StatefulBuilder(
                builder: (BuildContext context, StateSetter setModalState) {
                  return Container(
                    color: AppColors.darkBlue,
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 16,
                      children: [
                        ContactsText(text: textController.text,),
                        ContactsText(text: emailController.text,),
                        Text('${phontController.text}',
                          style: AppStyles.mediumTitle,),
                        Form(
                          key: _formKey,
                          child: Column(
                            spacing: 8,
                            children: [
                              ContactsTextForm(hintText: 'Enter User Name ',controller: textController,),
                              ContactsTextForm(hintText: 'Enter User Email ',controller: emailController,),
                              ContactsTextForm(hintText: 'Enter User Phone',controller: phontController,),

                            ],
                          ),
                        ),
                        ContactsElevatedButton(),
                      ],
                    ),
                  );
                }
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
