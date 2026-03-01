
import 'package:contact_app/core/utils/app_colors.dart';
import 'package:contact_app/ui/widgets/contacts_floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

import '../../core/models/contact_model.dart';
import '../../core/utils/app_assets.dart';
import '../../core/utils/app_styles.dart';
import '../widgets/contacts_grid_view.dart';

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
            : ContactsGridView(contactList: contactList)
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
