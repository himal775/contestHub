import 'package:contest_hub/view/HomePage/giveAways.dart';
import 'package:contest_hub/view/HomePage/photo.dart';
import 'package:contest_hub/view/HomePage/writing.dart';
import 'package:contest_hub/view/organizePage/contestDetails.dart';
import 'package:contest_hub/view/quiz/quiz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red[400],
        actions: [
          Icon(Icons.notifications),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Container(
        color: Colors.red[400],
        child: Stack(children: [
          Column(
            children: [
              Stack(children: [
                Container(
                  height: 90,
                  decoration: BoxDecoration(
                    color: Colors.red[400],
                    // borderRadius: BorderRadius.only(
                    //     bottomRight: Radius.circular(30),
                    //     bottomLeft: Radius.circular(30))
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      Text(
                        "Welcome Himal",
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 28,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(20)),
                          child: TextFormField(
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(10),
                                hintText: "Search Contest",
                                icon: Icon(Icons.search)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ]),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      )),
                  child: ListView(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "Contest Category",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      // const Center(
                      //   child: Text(
                      //     "Explore the Contests you want to participate",
                      //     style: TextStyle(
                      //         fontWeight: FontWeight.bold,
                      //         fontSize: 20,
                      //         color: Colors.black54),
                      //   ),
                      // ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 110,
                                width: 130,

                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 1,
                                          spreadRadius: 1)
                                    ]),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: const [
                                    Icon(
                                      Icons.photo,
                                      size: 64,
                                      color: Colors.red,
                                    ),
                                    Text("Contest",
                                        style: TextStyle(
                                          fontSize: 16,
                                        )),
                                  ],
                                ),
                                // child:,
                              ),
                            ),
                            onTap: () {
                              (Get.to(() => PhotoContest()));
                            },
                          ),
                          InkWell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 110,
                                width: 130,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 1,
                                          spreadRadius: 1)
                                    ]),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: const [
                                    Icon(
                                      Icons.create,
                                      size: 64,
                                      color: Colors.red,
                                    ),
                                    Text("Polls",
                                        style: TextStyle(
                                          fontSize: 16,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                            onTap: (() {
                              // Get.to(() => UserInformation());
                            }),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              child: Container(
                                height: 110,
                                width: 130,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 1,
                                          spreadRadius: 1)
                                    ]),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: const [
                                    Icon(
                                      Icons.card_giftcard,
                                      size: 64,
                                      color: Colors.red,
                                    ),
                                    Text("Give Aways",
                                        style: TextStyle(
                                          fontSize: 16,
                                        )),
                                  ],
                                ),
                              ),
                              onTap: () {
                                // Get.to(() => GiveAways());
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              child: Container(
                                height: 110,
                                width: 130,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 1,
                                          spreadRadius: 1)
                                    ]),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: const [
                                    Icon(
                                      Icons.timer,
                                      size: 64,
                                      color: Colors.red,
                                    ),
                                    Text("Quiz Contest",
                                        style: TextStyle(
                                          fontSize: 16,
                                        )),
                                  ],
                                ),
                              ),
                              onTap: () {},
                            ),
                          )
                        ],
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //   children: [
                      //     InkWell(
                      //       child: Padding(
                      //         padding: const EdgeInsets.all(8.0),
                      //         child: Container(
                      //           height: 100,
                      //           width: 130,
                      //           decoration: BoxDecoration(
                      //               borderRadius: BorderRadius.circular(20),
                      //               color: Colors.white,
                      //               boxShadow: [
                      //                 BoxShadow(
                      //                     color: Colors.grey,
                      //                     blurRadius: 1,
                      //                     spreadRadius: 1)
                      //               ]),
                      //           child: Column(
                      //             mainAxisAlignment:
                      //                 MainAxisAlignment.spaceAround,
                      //             children: const [
                      //               Icon(
                      //                 Icons.poll,
                      //                 size: 64,
                      //                 color: Colors.red,
                      //               ),
                      //               Text("Polls & Pick",
                      //                   style: TextStyle(
                      //                     fontSize: 16,
                      //                   )),
                      //             ],
                      //           ),
                      //         ),
                      //       ),
                      //       onTap: () {
                      //         // Get.to(() => PhotoContest());
                      //       },
                      //     ),
                      //     Padding(
                      //       padding: const EdgeInsets.all(8.0),
                      //       child: Container(
                      //         height: 100,
                      //         width: 130,
                      //         decoration: BoxDecoration(
                      //             borderRadius: BorderRadius.circular(20),
                      //             color: Colors.white,
                      //             boxShadow: [
                      //               BoxShadow(
                      //                   color: Colors.grey,
                      //                   blurRadius: 1,
                      //                   spreadRadius: 1)
                      //             ]),
                      //         child: Column(
                      //           mainAxisAlignment:
                      //               MainAxisAlignment.spaceAround,
                      //           children: const [
                      //             Icon(
                      //               Icons.video_library,
                      //               size: 64,
                      //               color: Colors.red,
                      //             ),
                      //             Text("Video Contest",
                      //                 style: TextStyle(
                      //                   fontSize: 16,
                      //                 )),
                      //           ],
                      //         ),
                      //       ),
                      //     )
                      //   ],
                      // ),
                      // SizedBox(height: 10),
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  "Feature Contest",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              // SizedBox(
                              //   width: 270,
                              // ),
                              // Icon(Icons.arrow_right_alt)
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 90,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 1,
                                          spreadRadius: 1),
                                    ]),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.card_giftcard,
                                      color: Colors.red[400],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Daily Contest",
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 90,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 1,
                                          spreadRadius: 1)
                                    ]),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.card_giftcard,
                                      color: Colors.red[400],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Weekly Contest",
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 90,
                                width: 120,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 1,
                                        spreadRadius: 1)
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.card_giftcard,
                                      color: Colors.red[400],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Monthly Contest",
                                    ),
                                  ],
                                )),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Popular Contest",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 210,
                              ),
                              Text("View all"),
                              Icon(Icons.arrow_right_alt)
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              // scrollDirection: Axis.horizontal,
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                    height: 220,
                                    width: 250,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 1,
                                              spreadRadius: 1)
                                        ]),
                                    child: Expanded(
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Title(
                                              color: Colors.black,
                                              child: Text(
                                                "Tihar Rangoli Competition",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ),
                                              )),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 100,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Colors.grey,
                                                          blurRadius: 1,
                                                          spreadRadius: 1)
                                                    ]),
                                                child: Image.network(
                                                  "https://jcinepal.org.np/images/eventImage/85871606670426IMG_20201129_215943.jpg",
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              CircleAvatar(
                                                radius: 20,
                                                backgroundColor: Colors.red,
                                              ),
                                              CircleAvatar(
                                                radius: 20,
                                                backgroundColor: Colors.blue,
                                              ),
                                              // CircleAvatar(
                                              //   radius: 20,
                                              //   backgroundColor: Colors.yellow,
                                              // ),
                                              CircleAvatar(
                                                radius: 20,
                                                backgroundColor: Colors.green,
                                                child: Text("+8"),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Icon(Icons.card_giftcard,
                                                          color:
                                                              Colors.red[400]),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        "Rs.2000",
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    children: [
                                                      // Icon(
                                                      //   Icons.timelapse_sharp,
                                                      //   color: Colors.red[400],
                                                      // ),
                                                      Text(
                                                        "2 days left",
                                                        style: TextStyle(
                                                            color: Colors.blue),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                    height: 170,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 1,
                                              spreadRadius: 1)
                                        ]),
                                    child: Expanded(
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Title(
                                              color: Colors.black,
                                              child: Text(
                                                "Tihar Rangoli Competition",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 100,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Colors.grey,
                                                          blurRadius: 1,
                                                          spreadRadius: 1)
                                                    ]),
                                                child: Image.network(
                                                    "https://tunza.eco-generation.org/file/Rangoli.jpg"),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Rs.2000",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "2 days left",
                                                    style: TextStyle(
                                                        color: Colors.blue),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 120,
                                  width: 300,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 1,
                                            spreadRadius: 1)
                                      ]),
                                ),
                                Container(
                                  height: 120,
                                  width: 300,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 1,
                                            spreadRadius: 1)
                                      ]),
                                ),
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
                                "Upcoming Contest",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              // SizedBox(
                              //   width: 190,
                              // ),
                              // Text("View all"),
                              // Icon(Icons.arrow_right_alt)
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 110,
                                width: 380,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          spreadRadius: 1,
                                          blurRadius: 1)
                                    ],
                                    borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                        height: 70,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey,
                                                blurRadius: 1,
                                                spreadRadius: 1)
                                          ],
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Container(
                                          height: 50,
                                          width: 50,
                                          child: Image.network(
                                              "https://images.squarespace-cdn.com/content/v1/5a008604017db2ab70ad1255/1609178397549-AYQW1IRHGH5ADI8J65TU/JPC_Banner_V2.jpg?format=2500w"),
                                        )),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Title: E-Commerce Logo Design ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        // CircleAvatar(
                                        //   backgroundColor: Colors.red,
                                        //   radius: 12,
                                        //   child: Text(
                                        //     "\$",
                                        //     style:
                                        //         TextStyle(color: Colors.white),
                                        //   ),
                                        // )
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Prize: Rs. 2000",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Organizer: IT Hub Nepal",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "2 days later",
                                          style: TextStyle(
                                            color: Colors.blue,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 110,
                                width: 380,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          spreadRadius: 1,
                                          blurRadius: 1)
                                    ],
                                    borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                        height: 70,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey,
                                                blurRadius: 1,
                                                spreadRadius: 1)
                                          ],
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Image.network(
                                            "https://assets.thehansindia.com/hansindia-bucket/QUI_7553.jpg")),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Title: National Quiz Competition ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        // CircleAvatar(
                                        //   backgroundColor: Colors.red,
                                        //   radius: 12,
                                        //   child: Text(
                                        //     "\$",
                                        //     style:
                                        //         TextStyle(color: Colors.white),
                                        //   ),
                                        // )
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Prize: Rs. 2000",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Organizer: PCPS College",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "2 days later",
                                          style: TextStyle(
                                            color: Colors.blue,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("View All"),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
