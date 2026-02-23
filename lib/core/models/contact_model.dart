import 'package:image_picker/image_picker.dart';

class ContactModel {
  String name;
  String email;
  String phoneNumber;
  XFile? image;
  ContactModel({required this.name,required this.email,required this.phoneNumber,required this.image,});
}