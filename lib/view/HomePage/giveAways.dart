import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contest_hub/view/HomePage/photoContestDetail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GiveAways extends StatefulWidget {
  @override
  State<GiveAways> createState() => _PhotoContestState();
}

class _PhotoContestState extends State<GiveAways> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('Give Aways').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Give Aways"),
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
                                // Icon(Icons.punch_clock),

                                Expanded(
                                  child: Center(
                                    child: Text(
                                      data['Title'],
                                      style: TextStyle(
                                          color: Colors.grey.shade800,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
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
                                    data["About Organizer"],
                                    overflow: TextOverflow.fade,
                                    style: TextStyle(
                                      color: Colors.grey.shade800,
                                    ),
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
                                      ),
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
