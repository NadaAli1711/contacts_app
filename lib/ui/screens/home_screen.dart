import 'dart:io';
import 'package:contact_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import '../../core/models/contact_model.dart';
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
  XFile? contactImage;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController textController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
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
        child: contactList.length == 0 ? Column(
          children: [
            Lottie.asset(AppJsons.animation),
            Text(
              'There is No Contacts Added Here',
              style: AppStyles.largeTitle,
            ),
          ],
        ):
            GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              childAspectRatio: 0.65,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
              itemBuilder: (context, index) => Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.gold,
                ),
                child: Column(
                  children:[
                    Expanded(flex:3,child: Stack(
                      children:[
                        Image.file(File(contactList[index].image!.path),fit: BoxFit.fill,width: double.infinity,),
                        // Container(
                        //
                        //   alignment: Alignment.bottomLeft,
                        //   height: 33,
                        //   width: 84,
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(8),
                        //     color: AppColors.gold,
                        //   ),
                        //   padding: EdgeInsets.all(8),
                        //   child: Text(contactList[index].name),
                        // )

                      ]
                    )
                    ),
                     Expanded(flex:2,child:Padding(
                       padding: const EdgeInsets.only(top: 15.0,left: 8,right: 8,bottom: 7),
                       child: Column(
                         spacing: 8,
                         children: [
                           Row(
                             spacing: 8,
                             children: [
                               Image.asset('assets/images/email.png'),
                               Text(contactList[index].email,style: AppStyles.smallBody,)
                             ],
                           ),
                           Row(
                             spacing: 8,
                             children: [
                               Image.asset('assets/images/Phone_call.png'),
                               Text(contactList[index].phoneNumber,style: AppStyles.smallBody,)
                             ],
                           ),
                              ContactsElevatedButton(onPressed: onPressed,)
                           // ElevatedButton(onPressed: (){}, child: Text("a"))
                         ],
                       ),
                     ))
                  ],
                ),
              ),
              itemCount: contactList.length,)
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
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: Container(
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: AppColors.gold),
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
                                ),
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
                        ContactsElevatedButton(onPressed: onPressed,color: AppColors.gold,text: 'Enter user',textStyle: AppStyles.buttonText ,height: 60,radius: 16,hasIcon: false,),
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

  void onPressed() {
    if(textController.text.isNotEmpty && emailController.text.isNotEmpty && phoneController.text.isNotEmpty&& contactImage != null){
     setState(() {
       contactList.add(
           ContactModel(name: textController.text, email: emailController.text, phoneNumber: phoneController.text, image: contactImage)
       );
     });
    }
    textController.clear();
    emailController.clear();
    phoneController.clear();

  }
}
