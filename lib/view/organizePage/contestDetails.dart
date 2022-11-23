import 'dart:io';
import 'package:contest_hub/provider/imageProvider.dart';
import 'package:contest_hub/provider/writedataProvider.dart';
import 'package:contest_hub/view/HomePage/photo.dart';
import 'package:contest_hub/view/bottomNavigation.dart';
import 'package:contest_hub/view/HomePage/homePage.dart';
import 'package:contest_hub/view/organizePage/prizeDetails.dart';
import 'package:contest_hub/view/quiz/quiz.dart';
import 'package:contest_hub/view/uploadContest.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class OrganizeEventPage extends StatefulWidget {
  const OrganizeEventPage({Key? key}) : super(key: key);

  @override
  State<OrganizeEventPage> createState() => _OrganizeEventPageState();
}

class _OrganizeEventPageState extends State<OrganizeEventPage> {
  String item = "Select";

  DateTime startdate = DateTime.now();
  DateTime enddate = DateTime.now();

  final _form = GlobalKey<FormState>();

  final titleController = TextEditingController();
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
                // Container(
                //   color: Colors.grey,
                //   height: 700,
                //   width: 450,
                // ),
                // Container(
                //     height: 90,
                //     decoration: BoxDecoration(
                //       color: Colors.red[400],
                //       // borderRadius: BorderRadius.only(
                //       //     bottomLeft: Radius.circular(20),
                //       //     bottomRight: Radius.circular(20))
                //     )),
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
                                "Contest Details",
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
                                "Category",
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
                                        child: Text("Contest"),
                                        value: "Contest",
                                      ),
                                      DropdownMenuItem(
                                        child: Text("Polls"),
                                        value: "Polls",
                                      ),
                                      DropdownMenuItem(
                                        child: Text("Quiz"),
                                        value: "Quiz",
                                      ),
                                      DropdownMenuItem(
                                        child: Text("GiveAways"),
                                        value: "GiveAways",
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
                          Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Title",
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
                              controller: titleController,
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
                                    hintText: "Enter Description of Contest",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Start Date",
                                style: TextStyle(
                                    color: Colors.grey.shade800, fontSize: 18),
                              ),
                              const Text(
                                "*",
                                style: TextStyle(color: Colors.red),
                              ),
                              const SizedBox(
                                width: 100,
                              ),
                              Text(
                                "End Date",
                                style: TextStyle(
                                    color: Colors.grey.shade800, fontSize: 18),
                              ),
                              const Text(
                                "*",
                                style: TextStyle(color: Colors.red),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                  child: Container(
                                    height: 90,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 1,
                                              spreadRadius: 1)
                                        ]),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 8,
                                          color: Colors.blue,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                            "${startdate.month}/${startdate.day}"),
                                      ],
                                    ),
                                  ),
                                  onTap: () async {
                                    DateTime? datetime = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime(2030),
                                    );

                                    if (datetime == null) {
                                      return;
                                    } else {
                                      setState(() {
                                        startdate = datetime;
                                      });
                                    }
                                  },
                                ),
                                InkWell(
                                  child: Container(
                                    height: 90,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 1,
                                              spreadRadius: 1)
                                        ]),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 8,
                                          color: Colors.red,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text("${enddate.month}/${enddate.day}"),
                                      ],
                                    ),
                                  ),
                                  onTap: () async {
                                    DateTime? datetime = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime(2030),
                                    );

                                    if (datetime == null) {
                                      return;
                                    } else {
                                      setState(() {
                                        enddate = datetime;
                                      });
                                    }
                                  },
                                )
                              ]),
                          SizedBox(
                            height: 20,
                          ),
                          // Text("Contest Photo"),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              // SizedBox(
                              //   width: 10,
                              // ),
                              // Container(
                              //   height: 50,
                              //   width: 175,
                              //   decoration: BoxDecoration(
                              //       borderRadius: BorderRadius.circular(20),
                              //       border: Border.all(color: Colors.grey)),
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.center,
                              //     children: [
                              //       InkWell(
                              //         child: Icon(Icons.calendar_month,
                              //             color: Colors.red),
                              //         onTap: () async {
                              //           DateTime? datetime =
                              //               await showDatePicker(
                              //             context: context,
                              //             initialDate: DateTime.now(),
                              //             firstDate: DateTime.now(),
                              //             lastDate: DateTime(2030),
                              //           );

                              //           if (datetime == null) {
                              //             return;
                              //           } else {
                              //             setState(() {
                              //               date = datetime;
                              //             });
                              //           }
                              //         },
                              //       ),
                              //       const SizedBox(
                              //         width: 10,
                              //       ),
                              //       Text(
                              //         "${date.year}/${date.month}/${date.day}",
                              //         style: TextStyle(
                              //             color: Colors.grey.shade800),
                              //       ),
                              //     ],
                              //   ),
                              // ),

                              Container(
                                height: 60,
                                width: 190,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.grey)),
                                child: IconButton(
                                  icon: image == null
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Icon(Icons.file_upload_outlined),
                                            Text("Upload  Photo")
                                          ],
                                        )
                                      : Text(
                                          "${image.name}",
                                          style:
                                              TextStyle(color: Colors.red[400]),
                                        ),
                                  color: Colors.red,
                                  onPressed: (() {
                                    ref.read(imageProvider).imagePick();
                                  }),
                                ),
                              )
                            ],
                          ),
                          // Row(
                          //   children: [
                          //     const SizedBox(
                          //       width: 10,
                          //     ),
                          //     Text("Organizer's Name",
                          //         style: TextStyle(
                          //             color: Colors.grey.shade800,
                          //             fontWeight: FontWeight.bold,
                          //             fontSize: 20)),
                          //     const Text(
                          //       "*",
                          //       style: TextStyle(color: Colors.red),
                          //     ),
                          //   ],
                          // ),
                          // SizedBox(
                          //   height: 30,
                          // ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     Text(
                          //       "About Contest Organizer",
                          //       style: TextStyle(
                          //           color: Colors.grey[800],
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 20),
                          //     ),
                          //   ],
                          // ),
                          // SizedBox(
                          //   height: 10,
                          // ),
                          // Row(
                          //   children: [
                          //     const SizedBox(
                          //       width: 10,
                          //     ),
                          //     Text(
                          //       "Organizer's Name",
                          //       style: TextStyle(
                          //           color: Colors.grey.shade800, fontSize: 20),
                          //     ),
                          //     const Text(
                          //       "*",
                          //       style: TextStyle(color: Colors.red),
                          //     )
                          //   ],
                          // ),
                          // Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: TextFormField(
                          //     keyboardType: TextInputType.multiline,
                          //     minLines:
                          //         1, //Normal textInputField will be displayed
                          //     maxLines: 10,
                          //     controller: organizerNameController,
                          //     validator: ((value) {
                          //       if (value!.isEmpty) {
                          //         return "null";
                          //       } else {
                          //         return null;
                          //       }
                          //     }),
                          //     decoration: InputDecoration(
                          //         hintText: "Organizer Name",
                          //         border: OutlineInputBorder(
                          //             borderRadius: BorderRadius.circular(20))),
                          //   ),
                          // ),
                          // Row(
                          //   children: [
                          //     const SizedBox(
                          //       width: 10,
                          //     ),
                          //     Text("About Organizer",
                          //         style: TextStyle(
                          //             color: Colors.grey.shade800,
                          //             fontWeight: FontWeight.bold,
                          //             fontSize: 20)),
                          //     const Text(
                          //       "*",
                          //       style: TextStyle(color: Colors.red),
                          //     ),
                          //   ],
                          // ),
                          // Row(
                          //   children: [
                          //     const SizedBox(
                          //       width: 10,
                          //     ),
                          //     Text(
                          //       "About Organizer",
                          //       style: TextStyle(
                          //           color: Colors.grey.shade800, fontSize: 20),
                          //     ),
                          //     // const Text(
                          //     //   "*",
                          //     //   style: TextStyle(color: Colors.red),
                          //     // )
                          //   ],
                          // ),
                          // Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: TextFormField(
                          //     keyboardType: TextInputType.multiline,
                          //     minLines:
                          //         1, //Normal textInputField will be displayed
                          //     maxLines: 10,
                          //     controller: aboutOrganizerController,
                          //     validator: ((value) {
                          //       if (value!.isEmpty) {
                          //         return "null";
                          //       } else {
                          //         return null;
                          //       }
                          //     }),
                          //     decoration: InputDecoration(
                          //         contentPadding: EdgeInsets.only(
                          //             left: 10, right: 20, top: 30, bottom: 60),
                          //         hintText: "Enter something about Organizer",
                          //         border: OutlineInputBorder(
                          //             borderRadius: BorderRadius.circular(20))),
                          //   ),
                          // ),
                          // const SizedBox(
                          //   height: 10,
                          // ),
                          // Row(
                          //   // mainAxisAlignment: MainAxisAlignment.start,
                          //   children: [
                          //     const SizedBox(
                          //       width: 10,
                          //     ),
                          //     Text("Location Requirement",
                          //         style: TextStyle(
                          //             color: Colors.grey.shade800,
                          //             fontWeight: FontWeight.bold,
                          //             fontSize: 20)),
                          //     const Text(
                          //       "(if any)",
                          //       style: TextStyle(color: Colors.black87),
                          //     ),
                          //   ],
                          // ),
                          // Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: TextFormField(
                          //     keyboardType: TextInputType.multiline,
                          //     minLines:
                          //         1, //Normal textInputField will be displayed
                          //     maxLines: 10,
                          //     controller: locationController,
                          //     validator: ((value) {
                          //       if (value!.isEmpty) {
                          //         return "null";
                          //       } else {
                          //         return null;
                          //       }
                          //     }),
                          //     decoration: InputDecoration(
                          //         hintText: "Enter location requirement",
                          //         border: OutlineInputBorder(
                          //             borderRadius: BorderRadius.circular(20))),
                          //   ),
                          // ),
                          // Column(
                          //   // mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          // Container(
                          //   height: 35,
                          //   width: 200,
                          //   decoration: BoxDecoration(
                          //       border: Border.all(color: Colors.grey)),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     children: [
                          //       Text("Feature Photo",
                          //           style: TextStyle(
                          //               color: Colors.grey.shade800,
                          //               fontWeight: FontWeight.bold,
                          //               fontSize: 20)),
                          //       Text(
                          //         "*",
                          //         style: TextStyle(color: Colors.red),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          //   InkWell(
                          //     onTap: () {},
                          //     child: Container(
                          //       decoration: BoxDecoration(
                          //           border: Border.all(color: Colors.black)),
                          //       child: image == null
                          //           ? Center(
                          //               child: Text('please select an image'))
                          //           : Image.file(File(image.path)),
                          //       height: 200,
                          //       width: 500,
                          //     ),
                          //   ),
                          // ],
                          // ),
                          // const SizedBox(
                          //   height: 20,
                          // ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                          //   children: [
                          //     // Row(
                          //     //   children: [
                          //     //     Text(
                          //     //       "Category",
                          //     //       style: TextStyle(
                          //     //           color: Colors.grey.shade800,
                          //     //           fontWeight: FontWeight.bold,
                          //     //           fontSize: 20),
                          //     //     ),
                          //     //     const Text(
                          //     //       "*",
                          //     //       style: TextStyle(color: Colors.red),
                          //     //     ),
                          //     //   ],
                          //     // ),
                          //   ],
                          // ),
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
                    onTap: (() {
                      Get.to(() => prizeDetails());
                    }),
                    // onTap: () async {
                    //   if (image == null) {
                    //     Get.defaultDialog(
                    //         title: "Please Select an Image",
                    //         content: Text("Feature Photo is Required"),
                    //         actions: [
                    //           TextButton(
                    //               onPressed: (() {
                    //                 Navigator.of(context).pop();
                    //               }),
                    //               child: Text("Ok"))
                    //         ]);
                    //   } else {
                    //     _form.currentState!.save();
                    //     if (_form.currentState!.validate()) {
                    //       if (item == "Photo Contest") {
                    //         final response = await ref
                    //             .read(crudprovider)
                    //             .photo(
                    //                 titleController.text.trim(),
                    //                 contestDescriptionController.text.trim(),
                    //                 startdate.toString(),
                    //                 item,
                    //                 aboutOrganizerController.text.trim(),
                    //                 organizerNameController.text.trim(),
                    //                 locationController.text.trim(),
                    //                 image);
                    //         if (response != "Success") {
                    //           ScaffoldMessenger.of(context).showSnackBar(
                    //               SnackBar(
                    //                   duration: Duration(seconds: 1),
                    //                   content: Text('$response')));
                    //         } else {
                    //           Get.to(() => UploadContest(
                    //               aboutOrganizer:
                    //                   aboutOrganizerController.text.trim(),
                    //               category: item,
                    //               date: startdate,
                    //               description: contestDescriptionController
                    //                   .text
                    //                   .trim(),
                    //               image: image,
                    //               organizerName:
                    //                   organizerNameController.text.trim(),
                    //               title: titleController.text.trim()));
                    //         }
                    //       } else if (item == "Writing Contest") {
                    //         final response = await ref
                    //             .read(crudprovider)
                    //             .writing(
                    //                 titleController.text.trim(),
                    //                 contestDescriptionController.text.trim(),
                    //                 startdate.toString(),
                    //                 item,
                    //                 aboutOrganizerController.text.trim(),
                    //                 organizerNameController.text.trim(),
                    //                 locationController.text.trim(),
                    //                 image);
                    //         if (response != "Success") {
                    //           ScaffoldMessenger.of(context).showSnackBar(
                    //               SnackBar(
                    //                   duration: Duration(seconds: 1),
                    //                   content: Text('$response')));
                    //         } else {
                    //           Get.to(() => BottomNavigationPage());
                    //         }
                    //       } else if (item == "Quiz Contest") {
                    //         final response = await ref
                    //             .read(crudprovider)
                    //             .quiz(
                    //                 titleController.text.trim(),
                    //                 contestDescriptionController.text.trim(),
                    //                 startdate.toString(),
                    //                 item,
                    //                 aboutOrganizerController.text.trim(),
                    //                 organizerNameController.text.trim(),
                    //                 locationController.text.trim(),
                    //                 image);
                    //         if (response != "Success") {
                    //           ScaffoldMessenger.of(context).showSnackBar(
                    //               SnackBar(
                    //                   duration: Duration(seconds: 1),
                    //                   content: Text('$response')));
                    //         } else {
                    //           Get.to(() => BottomNavigationPage());
                    //         }
                    //       } else {
                    //         final response = await ref
                    //             .read(crudprovider)
                    //             .giveaways(
                    //                 titleController.text.trim(),
                    //                 contestDescriptionController.text.trim(),
                    //                 startdate.toString(),
                    //                 item,
                    //                 aboutOrganizerController.text.trim(),
                    //                 organizerNameController.text.trim(),
                    //                 locationController.text.trim(),
                    //                 image);
                    //         if (response != "Success") {
                    //           ScaffoldMessenger.of(context).showSnackBar(
                    //               SnackBar(
                    //                   duration: Duration(seconds: 1),
                    //                   content: Text('$response')));
                    //         } else {
                    //           Get.to(() => BottomNavigationPage());
                    //         }
                    //       }
                    //     } else {
                    //       return;
                    //     }
                    //   }
                    // }
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
