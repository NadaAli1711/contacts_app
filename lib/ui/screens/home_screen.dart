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
    var width = MediaQuery.of(context).size.width;
    double designWidth = 402;
    var height = MediaQuery.of(context).size.height;
    double designHeight = 874;
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      appBar: AppBar(
        title: SvgPicture.asset(AppImages.appBarLogo),
        centerTitle: false,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: EdgeInsets.all((16/designWidth)*width),
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
            crossAxisSpacing: (16/designWidth)*width,
            mainAxisSpacing: (16/designHeight)*height,
          ),
          itemBuilder: (context, index) =>
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular((16/designWidth)*width),
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
                                margin: EdgeInsets.only(bottom: (8/designHeight)*height, left: (7/designWidth)*width),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular((8/designWidth)*width),
                                  color: AppColors.gold,
                                ),
                                padding: EdgeInsets.all((8/designWidth)*width),
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
                        padding: EdgeInsets.only(
                          top: (15/designHeight)*height,
                          left: (8/designWidth)*width,
                          right: (8/designWidth)*width,
                          bottom: (7/designHeight)*height,
                        ),
                        child: Column(
                          spacing: (8/designHeight)*height,
                          children: [
                            Row(
                              spacing: (8/designWidth)*width,
                              children: [
                                Image.asset(AppImages.email),
                                Text(
                                  contactList[index].email,
                                  style: AppStyles.darkBlue10Medium,
                                ),
                              ],
                            ),
                            Row(
                              spacing: (8/designWidth)*width,
                              children: [
                                Image.asset(AppImages.Phone_call),
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
        spacing: (8/designHeight)*height,
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
