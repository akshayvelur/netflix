import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:netflix/common/utils.dart';
import 'package:netflix/models/up_comming_Model.dart';
import 'package:netflix/services/api_services.dart';
import 'package:netflix/widgets/movie_card_widgets.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  late Future<UpCommingMovieModel> upcomingFuture;
  late Future<UpCommingMovieModel> nowplaingFuture;
  Apiservices apiservices = Apiservices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    upcomingFuture = apiservices.getUpcomingMovies();
    nowplaingFuture = apiservices.getNowPlayingMovies();
    print("${"maincheck"} ${upcomingFuture}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        // centerTitle: true,
        title: Image.asset(
          "assets/logo.png",
          height: 50,
          width: 120,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: InkWell(
              onTap: () {},
              child: Icon(
                Icons.search,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Container(
              color: Colors.blue,
              height: 27,
              width: 27,
            ),
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 220,
              child: MovieCardWidget(
                  future: nowplaingFuture, headlineText: "Now playing"),
            ),
            SizedBox(
              height: 220,
              child: MovieCardWidget(
                  future: upcomingFuture, headlineText: "Upcoming Movies"),
            ),
          ],
        ),
      ),
    );
  }
}
