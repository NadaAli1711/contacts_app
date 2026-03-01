import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

import '../../core/utils/app_assets.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_styles.dart';

class FormImageDisplay extends StatelessWidget {
  bool imageRequired;
  XFile? contactImage;
  StateSetter setModalState;
  VoidCallback onTab;

  FormImageDisplay({super.key,required this.imageRequired,required this.contactImage,required this.setModalState, required this.onTab});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    double designWidth = 402;
    return  Column(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              border: Border.all(
                color: imageRequired
                    ? AppColors.red
                    : AppColors.gold,
              ),
              borderRadius: BorderRadius.circular((28/designWidth)*width),
            ),
            child: GestureDetector(
              onTap: onTab,

              child: contactImage != null
                  ? Image.file(
                File(contactImage!.path),
                fit: BoxFit.fill,
              )
                  : Lottie.asset(AppJsons.imagePicker),
            ),
          ),
        ),
        imageRequired
            ? Text(
          'This field is required',
          style: AppStyles.red10Medium,
        )
            : SizedBox(),
      ],
    );
  }


}
