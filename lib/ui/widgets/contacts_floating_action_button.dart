import 'package:contact_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../core/models/contact_model.dart';
import '../../core/utils/app_colors.dart';
import 'contacts_elevated_button.dart';
import 'contacts_form.dart';
import 'contacts_text.dart';
import 'form_image_display.dart';

class ContactsFloatingActionButton extends StatefulWidget {
  final List<ContactModel> contactList;
  final VoidCallback onContactAdded;

  const ContactsFloatingActionButton({
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
    var width = MediaQuery.of(context).size.width;
    double designWidth = 402;
    var height = MediaQuery.of(context).size.height;
    double designHeight = 874;
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
                  padding: EdgeInsets.only(
                    bottom:
                        MediaQuery.of(context).viewInsets.bottom +
                        (15 / designHeight) * height,
                    left: (16 / designWidth) * width,
                    right: (16 / designWidth) * width,
                    top: (10 / designHeight) * height,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    spacing: (16 / designHeight) * height,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: FormImageDisplay(
                              imageRequired: imageRequired,
                              contactImage: contactImage,
                              setModalState: setModalState,
                                onTab : () => pickContactImage(setModalState),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: (10 / designWidth) * width,
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
                      ContactsForm(
                        onChange: (s) => setModalState(() {}),
                        formKey: _formKey,
                        emailController: emailController,
                        phoneController: phoneController,
                        textController: textController,
                      ),

                      ContactsElevatedButton(
                        onPressed: () => onPressed(setModalState),
                        color: AppColors.gold,
                        text: 'Enter user',
                        textStyle: AppStyles.darkBlue20Regular,
                        buttonHeight: (60 / designHeight) * height,
                        radius: (16 / designWidth) * width,
                        hasIcon: false,
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ).then((onValue) {
          clearData();
        });
      },
      backgroundColor: AppColors.gold,
      child: Icon(Icons.add),
    );
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
    } else if (contactImage != null) {
      imageRequired = false;
    } else {
      imageRequired = true;
    }
    setModalState(() {});
  }

  void clearData() {
    setState(() {
      textController.clear();
      emailController.clear();
      phoneController.clear();
      contactImage = null;
      imageRequired = false;
    });
  }
  Future<void> pickContactImage(StateSetter setModalState) async {
    final ImagePicker picker = ImagePicker();
    // Pick an image.
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setModalState(() {
        contactImage = image;
        imageRequired = false;
      });
    }
  }
}
