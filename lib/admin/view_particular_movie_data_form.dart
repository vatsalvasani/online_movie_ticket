import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:onlinemovieticket/admin/view_particular_booked_ticket.dart';
import 'package:onlinemovieticket/admin/view_particular_movie_data.dart';
import 'package:onlinemovieticket/ipconfig.dart';
import 'package:onlinemovieticket/admin/update_booked_ticket.dart';
import 'package:onlinemovieticket/admin/view_booked_ticket_data.dart';
import 'package:onlinemovieticket/admin/view_movie_data.dart';
import 'package:onlinemovieticket/admin/view_particular_booked_ticket_form.dart';
import 'package:onlinemovieticket/admin/view_particular_movie_data_form.dart';
import 'package:onlinemovieticket/admin/view_particular_passed_out_show_form.dart';
import 'package:onlinemovieticket/admin/view_particular_upcoming_show_form.dart';
import 'package:onlinemovieticket/admin/view_passed_out_show.dart';
import 'package:onlinemovieticket/admin/view_upcoming_show.dart';
import '../utils/mytheme.dart';
import 'admin_home.dart';
import 'insert_movie_data.dart';
import 'insert_passed_out_show.dart';
import 'insert_upcoming_show.dart';

class view_particular_movie_data_form extends StatefulWidget {
  const view_particular_movie_data_form({Key? key}) : super(key: key);

  @override
  State<view_particular_movie_data_form> createState() => _view_particular_movie_data_formState();
}

class _view_particular_movie_data_formState extends State<view_particular_movie_data_form> {

  TextEditingController collection = TextEditingController();
  TextEditingController review1 = TextEditingController();
  TextEditingController review2 = TextEditingController();
  // TextEditingController time = TextEditingController()

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size * 1.0;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      appBar: AppBar(title: Text("Movies Data",style: TextStyle(color: Colors.white),),backgroundColor: Colors.pink,),
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
      backgroundColor: MyTheme.splash,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          height: _size.height,
          width: _size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/icons/splash_icon.svg"),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                padding: const EdgeInsets.all(19),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: _size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "View Particular Movie Data",
                      style: TextStyle(
                        fontSize: 16,
                        color: MyTheme.splash,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.black),
                        controller: review1,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Review 1",
                          hintStyle: const TextStyle(color: Colors.black45),
                          fillColor: MyTheme.greyColor,
                          filled: true,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.black),
                        controller: review2,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Review 2",
                          hintStyle: const TextStyle(color: Colors.black45),
                          fillColor: MyTheme.greyColor,
                          filled: true,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.black),
                        controller: collection,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Collection Is Equal To?",
                          hintStyle: const TextStyle(color: Colors.black45),
                          fillColor: MyTheme.greyColor,
                          filled: true,
                        ),
                      ),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>view_particular_movie_data(
                            collection.text,
                            review1.text,
                            review2.text
                        )));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: MyTheme.splash,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Text(
                            "VIEW",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.black.withOpacity(0.3),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
