import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:onlinemovieticket/admin/insert_movie_data.dart';
import 'package:onlinemovieticket/admin/insert_passed_out_show.dart';
import 'package:onlinemovieticket/admin/insert_upcoming_show.dart';
import 'package:onlinemovieticket/admin/view_booked_ticket_data.dart';
import 'package:onlinemovieticket/admin/view_movie_data.dart';
import 'package:onlinemovieticket/admin/view_particular_booked_ticket_form.dart';
import 'package:onlinemovieticket/admin/view_particular_movie_data_form.dart';
import 'package:onlinemovieticket/admin/view_particular_passed_out_show_form.dart';
import 'package:onlinemovieticket/admin/view_particular_upcoming_show_form.dart';
import 'package:onlinemovieticket/admin/view_passed_out_show.dart';
import 'package:onlinemovieticket/admin/view_upcoming_show.dart';
import 'package:pie_chart/pie_chart.dart';

import '../pages/login_screen.dart';
class admin_home extends StatefulWidget {
  const admin_home({Key? key}) : super(key: key);

  @override
  State<admin_home> createState() => _admin_homeState();
}

class _admin_homeState extends State<admin_home> {
  int key = 0;

  late List<movie> _movies = [];

  Map<String, double> getCategoryData() {
    Map<String, double> catMap = {};
    for (var item in _movies) {
      print(item.moviename);
      if (catMap.containsKey(item.moviename) == false) {
        catMap[item.moviename] = double.parse(item.collection);
      } else {
        catMap.update(item.moviename, (int) => catMap[item.moviename]! + 1);
        // test[item.category] = test[item.category]! + 1;
      }
      print(catMap);
    }
    return catMap;
  }

  List<Color> colorList = [
    Colors.pinkAccent,
    Colors.limeAccent,
    Colors.yellowAccent,
    Color.fromRGBO(255, 171, 67, 1),
    Colors.black,
    Color.fromRGBO(139, 135, 130, 1),
  ];

  Widget pieChartExampleOne() {
    return PieChart(
      key: ValueKey(key),
      dataMap: getCategoryData(),
      initialAngleInDegree: 0,
      animationDuration: Duration(milliseconds: 2000),
      chartType: ChartType.ring,
      chartRadius: MediaQuery.of(context).size.width / 1.5,
      ringStrokeWidth: 40,
      colorList: colorList,
      chartLegendSpacing: 32,
      chartValuesOptions: ChartValuesOptions(
          showChartValuesOutside: true,
          showChartValuesInPercentage: false,
          showChartValueBackground: true,
          showChartValues: true,
          chartValueStyle:
          TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
      centerText: 'Movie Collections',
      legendOptions: LegendOptions(
          showLegendsInRow: false,
          showLegends: true,
          legendShape: BoxShape.circle,
          legendPosition: LegendPosition.bottom,
          legendTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          )),
    );
  }

  signOut() async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> expStream =
    FirebaseFirestore.instance.collection('movies').snapshots();

    void getExpfromSanapshot(snapshot) {
      if (snapshot.docs.isNotEmpty) {
        _movies = [];
        for (int i = 0; i < snapshot.docs.length; i++) {
          var a = snapshot.docs[i];
          // print(a.data());
          movie exp = movie.fromJson(a.data());
          _movies.add(exp);
          // print(exp);
        }
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text("Admin",style: TextStyle(color: Colors.white),),backgroundColor: Colors.pink,
          actions: <Widget>[
          IconButton(
          icon: const Icon(Icons.logout),
          tooltip: '',
          onPressed: () {
          signOut();
      },
    ),

      ]
      ),
      drawer: Drawer(
        width: 400,
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.pinkAccent,
                  image: DecorationImage(
                  image: AssetImage("slider_banner.png"),
                  fit: BoxFit.cover)
            ),
              child: Text(''),
            ),

            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>admin_home()));
                // Navigator.pop(context);
              },
            ),

            ListTile(
              title: const Text('Insert Movie Data'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>insert_movie_data()));
                // Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Insert Passed Out Shows Data'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(context, MaterialPageRoute(builder: (context)=>insert_passed_out_show()));
                // Navigator.pop(context);
              },
            ),

            ListTile(
              title: const Text('Insert Upcoming Shows Data'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(context, MaterialPageRoute(builder: (context)=>insert_upcoming_show()));
                // Navigator.pop(context);
              },
            ),

            ListTile(
              title: const Text('View Booked Ticket Data'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(context, MaterialPageRoute(builder: (context)=>view_booked_ticket()));
                // Navigator.pop(context);
              },
            ),

            ListTile(
              title: const Text('View Movie Data'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(context, MaterialPageRoute(builder: (context)=>view_movie_data()));
                // Navigator.pop(context);
              },
            ),


            ListTile(
              title: const Text('View Upcoming Show Data'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(context, MaterialPageRoute(builder: (context)=>view_upcoming_show()));
                // Navigator.pop(context);
              },
            ),

            ListTile(
              title: const Text('View Passed Out Show Data'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(context, MaterialPageRoute(builder: (context)=>view_passed_out_shows()));
                // Navigator.pop(context);
              },
            ),

            ListTile(
              title: const Text('View Particular Booked Ticket Data'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(context, MaterialPageRoute(builder: (context)=>view_particular_booked_ticket_form()));
                // Navigator.pop(context);
              },
            ),

            ListTile(
              title: const Text('View Particular Movie Data'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(context, MaterialPageRoute(builder: (context)=>view_particular_movie_data_form()));
                // Navigator.pop(context);
              },
            ),

            ListTile(
              title: const Text('View Particular Passed Out Show Data'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(context, MaterialPageRoute(builder: (context)=>view_particular_passed_out_show_form()));
                // Navigator.pop(context);
              },
            ),

            ListTile(
              title: const Text('View Particular Upcoming Show Data'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(context, MaterialPageRoute(builder: (context)=>view_particular_upcoming_show_form()));
                // Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
         body: StreamBuilder<Object>(
            stream: expStream,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text("something went wrong");
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }
              final data = snapshot.requireData;
              print("Data: $data");
              getExpfromSanapshot(data);
              return pieChartExampleOne();
            },
          ),
      );
  }
}

class movie {
  String moviename;
  String collection;
  // String date;
  // String description;

  movie(
      {required this.moviename,
        required this.collection,
        // required this.date,
        // required this.description
      });

  factory movie.fromJson(Map<String, dynamic> json) {
    print(json['totalcollection']);
    return movie(
      moviename: json['moviename'],
      collection: json['totalcollection'].toString(),
    );
  }
}

