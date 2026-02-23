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
  final TextEditingController phonetController = TextEditingController();
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
            backgroundColor: AppColors.transparent,
            isScrollControlled: true,
            builder: (context) {
              return StatefulBuilder(
                builder: (BuildContext context, StateSetter setModalState) {
                  return Container(
                    decoration: BoxDecoration(
                      color: AppColors.darkBlue,
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                    ),
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 16,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  border: BoxBorder.all(color: AppColors.gold),
                                  borderRadius: BorderRadius.circular(28),
                                ),
                                child: Lottie.asset(AppJsons.imagePicker),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: Column(
                                  children: [
                                    ContactsText(
                                      textController: textController,
                                      hintText: 'User Name',
                                    ),
                                    ContactsText(
                                      textController: emailController,
                                      hintText: 'example@email.com',
                                    ),
                                    ContactsText(
                                      textController: phonetController,
                                      hintText: '+200000000000',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            spacing: 8,
                            children: [
                              ContactsTextForm(
                                hintText: 'Enter User Name ',
                                controller: textController,
                                onChange: (s) => setModalState(() {}),
                              ),
                              ContactsTextForm(
                                hintText: 'Enter User Email ',
                                controller: emailController,
                                onChange: (s) => setModalState(() {}),
                              ),
                              ContactsTextForm(
                                hintText: 'Enter User Phone',
                                controller: phonetController,
                                onChange: (s) => setModalState(() {}),
                              ),
                            ],
                          ),
                        ),
                        ContactsElevatedButton(),
                      ],
                    ),
                  );
                },
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
