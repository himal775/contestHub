import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';

class UploadContest extends StatelessWidget {
  const UploadContest(
      {super.key,
      required this.category,
      required this.image,
      required this.title,
      required this.description,
      required this.date,
      required this.organizerName,
      required this.aboutOrganizer});
  final String category;
  final String title;
  final String description;
  final DateTime date;
  final XFile image;
  final String organizerName;
  final String aboutOrganizer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("$title"),
      ),
      body: ListView(children: [
        Text("$title"),
        Container(
          height: 200,
          child: Image.file(File(image.path)),
        ),
        Text("About Us"),
        Text("$description")
      ]),
    );
  }
}
