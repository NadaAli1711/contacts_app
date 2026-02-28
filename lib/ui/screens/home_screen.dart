import 'dart:io';

import 'package:contact_app/core/utils/app_colors.dart';
import 'package:contact_app/ui/widgets/contacts_floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

import '../../core/models/contact_model.dart';
import '../../core/utils/app_assets.dart';
import '../../core/utils/app_styles.dart';
import '../widgets/contacts_elevated_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ContactModel> contactList = [];
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
        child: contactList.isEmpty
            ? Column(
          children: [
            Lottie.asset(AppJsons.animation),
            Text(
              'There is No Contacts Added Here',
              style: AppStyles.gold20Medium,
            ),
          ],
        )
            : GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.65,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemBuilder: (context, index) =>
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.gold,
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Stack(
                        children: [
                          Image.file(
                            File(contactList[index].image!.path),
                            fit: BoxFit.fill,
                            width: double.infinity,
                          ),

                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 8, left: 7),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: AppColors.gold,
                                ),
                                padding: EdgeInsets.all(8),
                                child: Text(contactList[index].name),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 15.0,
                          left: 8,
                          right: 8,
                          bottom: 7,
                        ),
                        child: Column(
                          spacing: 8,
                          children: [
                            Row(
                              spacing: 8,
                              children: [
                                Image.asset('assets/images/email.png'),
                                Text(
                                  contactList[index].email,
                                  style: AppStyles.darkBlue10Medium,
                                ),
                              ],
                            ),
                            Row(
                              spacing: 8,
                              children: [
                                Image.asset('assets/images/Phone_call.png'),
                                Text(
                                  contactList[index].phoneNumber,
                                  style: AppStyles.darkBlue10Medium,
                                ),
                              ],
                            ),
                            ContactsElevatedButton(onPressed: () {
                              contactList.removeAt(index);
                              setState(() {

                              });
                            }),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          itemCount: contactList.length,
        ),
      ),

      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 8,
        children: [
          contactList.isNotEmpty ? FloatingActionButton(onPressed: () {
            contactList.removeLast();
            setState(() {});
          },
            backgroundColor: AppColors.red,
            child: Icon(Icons.delete_rounded, color: AppColors.white,),
          ) : SizedBox(),
          contactList.length < 6 ? ContactsFloatingActionButton(
            contactList: contactList,
            onContactAdded: () => setState(() {}),
          ) : SizedBox()
        ],
      ),
    );
  }
}
