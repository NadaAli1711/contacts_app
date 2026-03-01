import 'package:flutter/material.dart';

import '../../core/utils/app_validators.dart';
import 'contacts_text_form.dart';
typedef OnChange = void Function(String);
class ContactsForm extends StatefulWidget {
  final OnChange onChange;
  final TextEditingController textController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final formKey;
  const ContactsForm({super.key, required this.onChange, required this.formKey,required this.emailController ,required this.phoneController,required this.textController});

  @override
  State<ContactsForm> createState() => _ContactsFormState();
}

class _ContactsFormState extends State<ContactsForm> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    double designHeight = 874;
    return Form(
      key: widget.formKey,
      child: Column(
        spacing: (5/designHeight)*height,
        children: [
          ContactsTextForm(
            label: "name",
            hintText: 'Enter User Name ',
            controller: widget.textController,
            onChange: widget.onChange,
            keyboardType: TextInputType.text,
            validator: AppValidators.nameValidator,
          ),
          ContactsTextForm(
            label: "email",
            hintText: 'Enter User Email ',
            controller: widget.emailController,
            onChange: widget.onChange,
            keyboardType: TextInputType.emailAddress,
            validator: AppValidators.emailValidator,
          ),
          ContactsTextForm(
            label: "phone",
            hintText: 'Enter User Phone',
            controller: widget.phoneController,
            onChange: widget.onChange,
            keyboardType: TextInputType.phone,
            validator: AppValidators.phoneValidator,
          ),
        ],
      ),
    );
  }
}
