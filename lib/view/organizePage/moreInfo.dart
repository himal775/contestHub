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

class moreInfo extends StatefulWidget {
  const moreInfo({Key? key}) : super(key: key);

  @override
  State<moreInfo> createState() => _moreInfoState();
}

class _moreInfoState extends State<moreInfo> {
  String item = "Select Winner by:";
  String winners = "No.of Winners";
  String location = "All Nepal";
  bool vote = false;

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
                                "More Information",
                                style: TextStyle(
                                    color: Colors.grey[800],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              // Text(
                              //   "4/4",
                              //   style: TextStyle(
                              //       color: Colors.grey[800], fontSize: 16),
                              // ),
                            ],
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
                                "Send Entries to mail",
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
                                hintText:
                                    "Enter email of company to receive event progress",
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
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "How to select Winner?",
                                style: TextStyle(
                                    color: Colors.grey.shade800,
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ],
                          ),
                          SizedBox(
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
                                          "Select Winner by:",
                                          style: TextStyle(
                                              color: Colors.grey.shade700),
                                        ),
                                        value: "Select Winner by:",
                                      ),
                                      DropdownMenuItem(
                                        child: Text("Random Generator"),
                                        value: "Random Generator",
                                      ),
                                      DropdownMenuItem(
                                        child: Text("Vote Out"),
                                        value: "Vote Out",
                                      ),
                                      DropdownMenuItem(
                                        child: Text("In my hand"),
                                        value: "In my hand",
                                      ),
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
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Location",
                                style: TextStyle(
                                    color: Colors.grey.shade800,
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ],
                          ),
                          SizedBox(
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
                                    value: location,
                                    items: [
                                      DropdownMenuItem(
                                        child: Text(
                                          "All Nepal",
                                          style: TextStyle(
                                              color: Colors.grey.shade700),
                                        ),
                                        value: "All Nepal",
                                      ),
                                      DropdownMenuItem(
                                        child: Text("Kathmandu"),
                                        value: "Kathmandu",
                                      ),
                                      DropdownMenuItem(
                                        child: Text("Pokhara"),
                                        value: "Pokhara",
                                      ),
                                      DropdownMenuItem(
                                        child: Text("Biratnagar"),
                                        value: "Biratnagar",
                                      ),
                                      DropdownMenuItem(
                                        child: Text("Butwal"),
                                        value: "Butwal",
                                      ),
                                      DropdownMenuItem(
                                        child: Text("Dharan"),
                                        value: "Dharan",
                                      ),
                                      DropdownMenuItem(
                                        child: Text("Dhangadi"),
                                        value: "Dhangadi",
                                      ),
                                    ],
                                    onChanged: (val) {
                                      setState(() {
                                        location = val.toString();
                                      });
                                    }),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Allow Vote out Method",
                                style: TextStyle(
                                    color: Colors.grey.shade800, fontSize: 20),
                              ),
                              SizedBox(
                                width: 25,
                              ),
                              Switch(
                                activeColor: Colors.lightGreenAccent,
                                value: vote,
                                onChanged: (bool value) {
                                  setState(() {
                                    vote = value;
                                  });
                                },
                              )
                            ],
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
                SizedBox(
                  height: 10,
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
                      Get.to(() => BottomNavigationPage());
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
