import 'package:flutter/material.dart';
import 'package:jobsque/Pages/Applied%20Job/Applied%20Jobs.dart';
import 'package:jobsque/Pages/Home%20&%20Search/Home Feeds .dart';
import 'package:jobsque/Pages/Messages/chats%20list.dart';
import 'package:jobsque/Pages/Profile/profile.dart';
import 'package:jobsque/Pages/Saved%20Jobs/saved%20jobs.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int myindex=0;
  List <Widget> widgetlist =  [
    Home_Screen(),
    Chats_List(),
    Applied(),
    Saved(),
    profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: widgetlist[myindex],
      ),

      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              myindex = index;
            });
          },
          elevation: 0,
          backgroundColor: Colors.transparent.withOpacity(0.5),
          type: BottomNavigationBarType.shifting,
          currentIndex: myindex,
          selectedItemColor: Colors.blue[700],
          unselectedFontSize: 15,
          unselectedItemColor: Colors.black54,
          iconSize: 20,
          items: [
            BottomNavigationBarItem(icon:Icon(Icons.home_filled),label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.message),label: "Messages"),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_rounded),label: "Applied"),
            BottomNavigationBarItem(icon: Icon(Icons.bookmark_border),label: "Saved"),
            BottomNavigationBarItem(icon: Icon(Icons.perm_identity_rounded),label: "Profile")
          ]
      ),
    );
  }
}
