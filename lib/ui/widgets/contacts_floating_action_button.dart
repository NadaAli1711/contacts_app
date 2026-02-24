import 'dart:io';

import 'package:contact_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

import '../../core/models/contact_model.dart';
import '../../core/utils/app_assets.dart';
import '../../core/utils/app_colors.dart';
import 'contacts_elevated_button.dart';
import 'contacts_text.dart';
import 'contacts_text_form.dart';

class ContactsFloatingActionButton extends StatefulWidget {
  List<ContactModel> contactList;
  VoidCallback onContactAdded;

  ContactsFloatingActionButton({
    super.key,
    required this.contactList,
    required this.onContactAdded,
  });

  @override
  State<ContactsFloatingActionButton> createState() =>
      _ContactsFloatingActionButtonState();
}

class _ContactsFloatingActionButtonState
    extends State<ContactsFloatingActionButton> {
  XFile? contactImage;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController textController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController emailController = TextEditingController();
  bool imageRequired = false;
  @override
  Widget build(BuildContext context) {
    imageRequired = false;
    return FloatingActionButton(
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
                            child: Column(

                              children: [
                                AspectRatio(aspectRatio: 1, child: Container(


                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: imageRequired
                                        ? AppColors.red
                                        : AppColors.gold),
                                    borderRadius: BorderRadius.circular(28),
                                  ),
                                  child: GestureDetector(
                                    onTap: () =>
                                        pickContactImage(setModalState),
                                    child: contactImage != null
                                        ? Image.file(
                                      File(contactImage!.path),
                                      fit: BoxFit.fill,
                                    )
                                        : Lottie.asset(AppJsons.imagePicker),
                                  ),
                                )),
                                imageRequired ? Text('This field is required',
                                  style: AppStyles.errorText,) : SizedBox()
                              ],
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
                                    textController: phoneController,
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
                              controller: phoneController,
                              onChange: (s) => setModalState(() {}),
                            ),
                          ],
                        ),
                      ),
                      ContactsElevatedButton(
                        onPressed: () => onPressed(setModalState),
                        color: AppColors.gold,
                        text: 'Enter user',
                        textStyle: AppStyles.buttonText,
                        height: 60,
                        radius: 16,
                        hasIcon: false,
                      ),
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
    );
  }

  Future<void> pickContactImage(StateSetter setModalState) async {
    final ImagePicker picker = ImagePicker();
    // Pick an image.
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setModalState(() {
        contactImage = image;
      });
    }
  }

  void onPressed(StateSetter setModalState) {
    if (_formKey.currentState!.validate() && contactImage != null) {
      widget.contactList.add(
        ContactModel(
          name: textController.text,
          email: emailController.text,
          phoneNumber: phoneController.text,
          image: contactImage,
        ),
      );
      widget.onContactAdded();
      Navigator.pop(context);
      textController.clear();
      emailController.clear();
      phoneController.clear();
      contactImage = null;
    } else if (contactImage != null) {
      imageRequired = false;
    } else {
      imageRequired = true;
    }
    setModalState(() {});

  }
}
