import 'package:contest_hub/view/HomePage/photo.dart';
import 'package:contest_hub/view/organizePage/contestDetails.dart';
import 'package:contest_hub/view/HomePage/homePage.dart';
import 'package:contest_hub/view/winnerPage.dart';
import 'package:flutter/material.dart';

class BottomNavigationPage extends StatefulWidget {
  BottomNavigationPage({Key? key}) : super(key: key);

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int selecteditem = 0;
  List<Widget> pagename = [HomePage(), OrganizeEventPage(), WinnerPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            blurRadius: 2,
          )
        ]),
        child: BottomNavigationBar(
            backgroundColor: Colors.white,
            unselectedItemColor: Colors.black54,
            selectedItemColor: Colors.red[400],
            currentIndex: selecteditem,
            onTap: (int index) {
              setState(() {
                selecteditem = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_filled,
                  ),
                  label: "Home",
                  backgroundColor: Colors.white),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_circle,
                  size: 30,
                ),
                label: "Organize",
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.abc,
                  ),
                  label: "Winners"),
            ]),
      ),
      body: pagename.elementAt(selecteditem),
    );
  }
}
