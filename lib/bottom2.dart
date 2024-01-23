import 'package:flutter/material.dart';

import 'ott17fav.dart';
import 'ott18search.dart';
import 'ott5homepage.dart';
import 'ott6appbarmenuinformation.dart';





class ottbotnavi extends StatefulWidget {
  const ottbotnavi({super.key});

  @override
  State<ottbotnavi> createState() => _ottbotnaviState();
}

class _ottbotnaviState extends State<ottbotnavi> {
  int _currentIndex = 0;

  final tabs = [
    otthomepage(),
    ottsear(),
    ottfav(),
    ott6menu(),



  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          iconSize: 30,
          selectedFontSize: 15,
          // unselectedFontSize: 50,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.cabin_sharp,color: Colors.black,),
              label: "Home",
              backgroundColor: Colors.grey,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search_rounded,color: Colors.black,),
              label: "Search",
              backgroundColor: Colors.lightGreen,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,color: Colors.black,),
              label: "Favorite",
              backgroundColor: Colors.green,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.menu_outlined,color: Colors.black,),
              label: "Menu",
              backgroundColor: Colors.blue,
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          }
      ),

    );
  }
}
