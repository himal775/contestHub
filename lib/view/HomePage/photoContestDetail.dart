import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetailPage extends StatelessWidget {
  DetailPage({Key? key}) : super(key: key);
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('Photo').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Contest Hub"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading");
          }

          return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;

            return Column(
              children: [
                Container(
                  height: 200,
                  width: 500,
                  decoration: new BoxDecoration(
                      image: new DecorationImage(
                    image: new NetworkImage(
                        "https://image.shutterstock.com/image-photo/patan-ancient-city-kathmandu-valley-260nw-1137140381.jpg"),
                    fit: BoxFit.fill,
                  )),
                ),
                Center(
                  child: Text(data['Title'],
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ),
              const  SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children:const [
                        Icon(
                          Icons.category,
                          color: Colors.red,
                        ),
                        Text(
                          "Category:",
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          "Art",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    Row(
                      children: const[
                        Icon(Icons.calendar_month, color: Colors.red),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "2022-12-09/2023-01-01",
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: const[
                        Icon(
                          Icons.location_on,
                          color: Colors.red,
                        ),
                        Text(
                          " Kathmandu",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    Row(
                      children: const[
                        Icon(Icons.timelapse, color: Colors.red),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "7 am to 9 pm",
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.grey.shade300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const[
                        Text("About Us",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "jshdfbdsh ksdhjbfjhsd sjdhfbsdjh ksdjfd dkfjbdf sdkfjbdhd sdkbd skdfjbsf sdfjbhf djfhbdfhj sdjhbdfdffffffffffff jdnkjd dhfdh dhjhf fdhgfhgfg dfghkgdfk fgkjfgj kjn",
                          style: TextStyle(fontSize: 17),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.grey.shade300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const[
                        Text("Contest Description",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "jshdfbdsh ksdhjbfjhsd sjdhfbsdjh ksdjfd dkfjbdf sdkfjbdhd sdkbd skdfjbsf sdfjbhf djfhbdfhj sdjhbdfdffffffffffff jdnkjd dhfdh dhjhf fdhgfhgfg dfghkgdfk fgkjfgj kjn",
                          style: TextStyle(fontSize: 17),
                        )
                      ],
                    ),
                  ),
                ),
               const SizedBox(
                  height: 20,
                ),
                Column(
                  children: const[
                    Icon(
                      Icons.add_circle,
                      color: Colors.red,
                    ),
                    Text("Tap to Participate")
                  ],
                ),
               const SizedBox(
                  height: 20,
                )
              ],
            );
          }).toList());
        },
      ),
    );
  }
}
