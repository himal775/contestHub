import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final crudprovider = Provider((ref) => CRUD());

class CRUD {
  Future<String> giveaways(
      String title,
      String description,
      String deadline,
      String category,
      String organizersName,
      String aboutOrganizer,
      String location,
      XFile? image) async {
    try {
      final ref =
          FirebaseStorage.instance.ref().child('userImage/${image!.name}');

      await ref.putFile(File(image.path));
      final imageUrl = await ref.getDownloadURL();
      final id = FirebaseAuth.instance.currentUser!.uid;
      final eventBased = FirebaseFirestore.instance.collection('Give Aways');

      eventBased.add({
        'Title': title,
        'Description': description,
        'Deadline': deadline,
        'Category': category,
        "Organizer's Name": organizersName,
        "About Organizer": aboutOrganizer,
        "Location": location,
        'Feature Photo': image
      });
      return 'Success';
    } catch (err) {
      return '$err';
    }
  }

  Future<String> writing(
      String title,
      String description,
      String deadline,
      String category,
      String organizersName,
      String aboutOrganizer,
      String location,
      XFile? image) async {
    try {
      final id = FirebaseAuth.instance.currentUser!.uid;
      final userdb = FirebaseFirestore.instance.collection('Writing');

      userdb.add({
        'Title': title,
        'Description': description,
        'Deadline': deadline,
        'Category': category,
        "Organizer's Name": organizersName,
        "About Organizer": aboutOrganizer,
        "Location": location,
        'Feature Photo': image
      });
      return 'Success';
    } catch (err) {
      return '$err';
    }
  }

  Future<String> quiz(
      String title,
      String description,
      String deadline,
      String category,
      String organizersName,
      String aboutOrganizer,
      String location,
      XFile? image) async {
    try {
      final id = FirebaseAuth.instance.currentUser!.uid;
      final userdb = FirebaseFirestore.instance.collection('Quiz');

      userdb.add({
        'Title': title,
        'Description': description,
        'Deadline': deadline,
        'Category': category,
        "Organizer's Name": organizersName,
        "About Organizer": aboutOrganizer,
        "Location": location,
        'Feature Photo': image
      });
      return 'Success';
    } catch (err) {
      return '$err';
    }
  }

  Future<String> photo(
      String title,
      String description,
      String deadline,
      String category,
      String organizersName,
      String aboutOrganizer,
      String location,
      XFile? featurePhoto) async {
    try {
      final id = FirebaseAuth.instance.currentUser!.uid;
      final userdb = FirebaseFirestore.instance.collection('Photo');

      userdb.add({
        'Title': title,
        'Description': description,
        'Deadline': deadline,
        'Category': category,
        "Organizer's Name": organizersName,
        "About Organizer": aboutOrganizer,
        "Location": location,
        'Feature Photo': featurePhoto
      });
      return 'Success';
    } catch (err) {
      return '$err';
    }
  }
}
