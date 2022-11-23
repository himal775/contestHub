import 'dart:io';
import 'package:contest_hub/provider/imageProvider.dart';
import 'package:contest_hub/provider/writedataProvider.dart';
import 'package:contest_hub/view/HomePage/photo.dart';
import 'package:contest_hub/view/bottomNavigation.dart';
import 'package:contest_hub/view/HomePage/homePage.dart';
import 'package:contest_hub/view/organizePage/organizerDetails.dart';
import 'package:contest_hub/view/quiz/quiz.dart';
import 'package:contest_hub/view/uploadContest.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class prizeDetails extends StatefulWidget {
  const prizeDetails({Key? key}) : super(key: key);

  @override
  State<prizeDetails> createState() => _prizeDetailsState();
}

class _prizeDetailsState extends State<prizeDetails> {
  String item = "Select";
  String winners = "No.of Winners";

  final _form = GlobalKey<FormState>();

  final prizetitleController = TextEditingController();
  final contestDescriptionController = TextEditingController();
  final deadlineController = TextEditingController();
  final aboutOrganizerController = TextEditingController();
  final organizerNameController = TextEditingController();
  final locationController = TextEditingController();

  final categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red[400],
        centerTitle: true,
        title: const Text(
          "Contest Hub",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 22),
        ),
        actions: [
          Icon(Icons.card_giftcard_sharp),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Consumer(
        builder: ((context, ref, child) {
          final image = ref.watch(imageProvider).image;
          return Form(
            key: _form,
            child: ListView(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Prize Details",
                                style: TextStyle(
                                    color: Colors.grey[800],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                " Prize Category",
                                style: TextStyle(
                                    color: Colors.grey.shade800,
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              const Text(
                                "*",
                                style: TextStyle(color: Colors.red),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 55,
                            width: 380,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.grey)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                    isExpanded: true,
                                    icon: Visibility(
                                        visible: true,
                                        child: Icon(Icons.arrow_drop_down)),
                                    value: item,
                                    items: [
                                      DropdownMenuItem(
                                        child: Text(
                                          "Select",
                                          style: TextStyle(
                                              color: Colors.grey.shade700),
                                        ),
                                        value: "Select",
                                      ),
                                      DropdownMenuItem(
                                        child: Text("Cash"),
                                        value: "Cash",
                                      ),
                                      DropdownMenuItem(
                                        child: Text("Gift Hampers"),
                                        value: "Gift Hampers",
                                      ),
                                      DropdownMenuItem(
                                        child: Text("Discount"),
                                        value: "Discount",
                                      ),
                                      DropdownMenuItem(
                                        child: Text("Others"),
                                        value: "Others",
                                      )
                                    ],
                                    onChanged: (val) {
                                      setState(() {
                                        item = val.toString();
                                      });
                                    }),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),

                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Prize Title",
                                style: TextStyle(
                                    color: Colors.grey.shade800,
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              const Text(
                                "*",
                                style: TextStyle(color: Colors.red),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              keyboardType: TextInputType.multiline,
                              minLines:
                                  1, //Normal textInputField will be displayed
                              maxLines: 10,
                              controller: prizetitleController,
                              validator: ((value) {
                                if (value!.isEmpty) {
                                  return "No value ";
                                } else {
                                  return null;
                                }
                              }),
                              decoration: InputDecoration(
                                hintText: "Title of Contest",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(100)
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Description",
                                style: TextStyle(
                                    color: Colors.grey.shade800, fontSize: 20),
                              ),
                              const Text(
                                "*",
                                style: TextStyle(color: Colors.red),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: TextFormField(
                                keyboardType: TextInputType.multiline,
                                minLines:
                                    1, //Normal textInputField will be displayed
                                maxLines: 10,
                                controller: contestDescriptionController,
                                validator: ((value) {
                                  if (value!.isEmpty) {
                                    return "No value";
                                  } else {
                                    return null;
                                  }
                                }),
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 35, horizontal: 12),
                                    hintText: "Enter prize description",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),

                          // Text("Contest Photo"),
                        ],
                      ),
                    ),
                  ),
                ),
                Center(
                  child: InkWell(
                    child: Container(
                      height: 40,
                      width: 350,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 2,
                                spreadRadius: 2,
                                color: Colors.white)
                          ],
                          color: Colors.red[400],
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Center(
                        child: Text(
                          "Next",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    onTap: () {
                      Get.to(() => AboutOrganizer());
                    },
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
