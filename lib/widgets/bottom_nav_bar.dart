import 'package:flutter/material.dart';
import 'package:netflix/screens/homescreen.dart';
import 'package:netflix/screens/more_screen.dart';
import 'package:netflix/screens/search_screen.dart';

class BottomNavi extends StatelessWidget {
  const BottomNavi({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          bottomNavigationBar: Container(
            color: Colors.black,
            height: 70,
            child: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.home),
                  text: "Home",
                ),
                Tab(
                  icon: Icon(Icons.search),
                  text: "Search",
                ),
                Tab(
                  icon: Icon(Icons.photo_library_outlined),
                  text: "New & Hot",
                )
              ],
              indicatorColor: Colors.transparent,
              labelColor: Colors.white,
              unselectedLabelColor: Color(0xff999999),
            ),
          ),
          body: TabBarView(
              children: [Homescreen(), SearchScreen(), MoreScreen()]),
        ));
  }
}
