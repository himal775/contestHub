import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';

class UserModel {
  String title;
  String description;
  String aboutOrganizer;
  String deadline;
  String category;
  XFile featurephoto;

  UserModel(
      {required this.title,
      required this.description,
      required this.aboutOrganizer,
      required this.deadline,
      required this.category,
      required this.featurephoto});
}
