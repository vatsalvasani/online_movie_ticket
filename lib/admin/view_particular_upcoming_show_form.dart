import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:onlinemovieticket/admin/view_particular_booked_ticket.dart';
import 'package:onlinemovieticket/admin/view_particular_upcoming_show.dart';
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

class view_particular_upcoming_show_form extends StatefulWidget {
  const view_particular_upcoming_show_form({Key? key}) : super(key: key);

  @override
  State<view_particular_upcoming_show_form> createState() => _view_particular_upcoming_show_formState();
}

class _view_particular_upcoming_show_formState extends State<view_particular_upcoming_show_form> {

  TextEditingController moviename = TextEditingController();
  TextEditingController date1 = TextEditingController();
  TextEditingController date2 = TextEditingController();
  // TextEditingController time = TextEditingController()

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size * 1.0;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      appBar: AppBar(title: Text("Particular Upcoming Show Data",style: TextStyle(color: Colors.white),),backgroundColor: Colors.pink,),
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
                      "View Particular Upcoming Shows",
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
                        controller: moviename,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Movie Name",
                          hintStyle: const TextStyle(color: Colors.black45),
                          fillColor: MyTheme.greyColor,
                          filled: true,
                        ),
                      ),
                    ),
                    TextField(
                      style: TextStyle(color: Colors.pinkAccent),
                      controller: date1,
                      //editing controller of this TextField
                      decoration: InputDecoration(
                          icon: Icon(Icons.calendar_today), //icon of text field
                          labelText: "Enter First Date" //label text of field
                      ),
                      readOnly: true,
                      //set it true, so that user will not able to edit text
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2101)
                        );

                        if (pickedDate != null) {
                          print(
                              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate = DateFormat('yyyy-MM-dd').format(
                              pickedDate);
                          print(
                              formattedDate); //formatted date output using intl package =>  2021-03-16
                          //you can implement different kind of Date Format here according to your requirement

                          setState(() {
                            date1.text =
                                formattedDate; //set output date to TextField value.
                          });
                        } else {
                          print("Date is not selected");
                        }
                      },
                    ),

                    TextField(
                      style: TextStyle(color: Colors.pinkAccent),
                      controller: date2,
                      //editing controller of this TextField
                      decoration: InputDecoration(
                          icon: Icon(Icons.calendar_today), //icon of text field
                          labelText: "Enter Second Date" //label text of field
                      ),
                      readOnly: true,
                      //set it true, so that user will not able to edit text
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2101)
                        );

                        if (pickedDate != null) {
                          print(
                              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate = DateFormat('yyyy-MM-dd').format(
                              pickedDate);
                          print(
                              formattedDate); //formatted date output using intl package =>  2021-03-16
                          //you can implement different kind of Date Format here according to your requirement

                          setState(() {
                            date2.text =
                                formattedDate; //set output date to TextField value.
                          });
                        } else {
                          print("Date is not selected");
                        }
                      },
                    ),


                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>view_particular_upcoming_show(
                            moviename.text,
                            date1.text,
                            date2.text
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
