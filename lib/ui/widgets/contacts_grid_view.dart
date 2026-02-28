import 'dart:io';

import 'package:flutter/material.dart';

import '../../core/models/contact_model.dart';
import '../../core/utils/app_assets.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_styles.dart';
import 'contacts_elevated_button.dart';

class ContactsGridView extends StatefulWidget {
final  List<ContactModel> contactList;
  const ContactsGridView({super.key,required this.contactList});

  @override
  State<ContactsGridView> createState() => _ContactsGridViewState();
}

class _ContactsGridViewState extends State<ContactsGridView> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    double designWidth = 402;
    var height = MediaQuery.of(context).size.height;
    double designHeight = 874;
    return GridView.builder(
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
                        File(widget.contactList[index].image!.path),
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
                            child: Text(widget.contactList[index].name),
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
                              widget.contactList[index].email,
                              style: AppStyles.darkBlue10Medium,
                            ),
                          ],
                        ),
                        Row(
                          spacing: (8/designWidth)*width,
                          children: [
                            Image.asset(AppImages.phoneCall),
                            Text(
                              widget.contactList[index].phoneNumber,
                              style: AppStyles.darkBlue10Medium,
                            ),
                          ],
                        ),
                        ContactsElevatedButton(onPressed: () {
                          widget.contactList.removeAt(index);
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
      itemCount: widget.contactList.length,
    );
  }
}
