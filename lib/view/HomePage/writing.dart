import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contest_hub/view/HomePage/photoContestDetail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserInformation extends StatefulWidget {
  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('Writing').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Writing Contest"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading");
          }
          if (!snapshot.hasData) {
            return const Text("Sorry there is no Contest  available");
          }

          return ListView(
            children: snapshot.data!.docs
                .map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;

                  return Column(children: [
                    InkWell(
                      child: Container(
                        height: 300,
                        width: 500,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 5,
                                ),
                                // Icon(Icons.punch_clock),
                                const SizedBox(width: 50),
                                Expanded(
                                  child: Text(
                                    data['Title'],
                                    style: TextStyle(
                                        color: Colors.grey.shade800,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Container(
                                    height: 200,
                                    width: 411,
                                    decoration: new BoxDecoration(
                                        image: new DecorationImage(
                                      image: new NetworkImage(
                                          "https://image.shutterstock.com/image-photo/patan-ancient-city-kathmandu-valley-260nw-1137140381.jpg"),
                                      fit: BoxFit.fill,
                                    )),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.business,
                                    color: Colors.red,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    data['Organizer'],
                                    overflow: TextOverflow.fade,
                                    style: TextStyle(
                                        color: Colors.grey.shade800,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.calendar_month,
                                        color: Colors.red,
                                      ),
                                    ),
                                    Text(
                                      data['Deadline'],
                                      style: TextStyle(
                                          color: Colors.grey.shade800,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Get.to(() => DetailPage());
                      },
                    ),
                    Divider(
                      color: Colors.grey.shade800,
                      thickness: 1,
                    ),
                  ]);
                })
                .toList()
                .cast(),
          );
        },
      ),
    );
  }
}
