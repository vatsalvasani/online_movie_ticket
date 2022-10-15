import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:onlinemovieticket/admin/view_booked_ticket_data.dart';
import 'package:onlinemovieticket/admin/view_movie_data.dart';
import 'package:onlinemovieticket/admin/view_particular_booked_ticket_form.dart';
import 'package:onlinemovieticket/admin/view_particular_movie_data_form.dart';
import 'package:onlinemovieticket/admin/view_particular_passed_out_show_form.dart';
import 'package:onlinemovieticket/admin/view_particular_upcoming_show_form.dart';
import 'package:onlinemovieticket/admin/view_passed_out_show.dart';
import 'package:onlinemovieticket/admin/view_upcoming_show.dart';
import 'package:onlinemovieticket/utils/mytheme.dart';
import 'package:http/http.dart' as http;
import 'package:onlinemovieticket/ipconfig.dart';
import 'dart:convert';

import '../admin/admin_home.dart';
import '../admin/insert_movie_data.dart';
import '../admin/insert_passed_out_show.dart';
import '../admin/insert_upcoming_show.dart';


class bookingform extends StatefulWidget {

  String moviename;
  String screenno;
  String price;
  String timing;
  String date;
  String id;
  String bookedseats;

  bookingform(this.id,this.moviename,this.screenno,this.price,this.timing,this.date,this.bookedseats);


  @override
  State<bookingform> createState() => _bookingformState();
}

class _bookingformState extends State<bookingform> {
  var successfull = 1;
  TextEditingController c_name = TextEditingController();
  TextEditingController no_of_seats = TextEditingController();

  // String uri = ipcon+"movieticket_api/insert_movie_data.php";

  Future<void> insertrecord() async {
    final CollectionReference docMovie = FirebaseFirestore.instance.collection(
        'booked_ticket');
    String seatno =(int.parse(widget.bookedseats)+1).toString();
    for(int i=2;i<=int.parse(no_of_seats.text);i++)
      {
        seatno = seatno + ',' + i.toString();
      }
    try {
      await docMovie.add({
        "c_name": c_name.text,
        "date": Timestamp.fromDate(DateTime.parse(widget.date)),
        "m_name": widget.moviename,
        "no_of_seats": int.parse(no_of_seats.text),
        "price": int.parse(widget.price),
        "screenno": int.parse(widget.screenno),
        "seatno": seatno,
        "timing": widget.timing,
      });
      int seat = int.parse(widget.bookedseats) + int.parse(no_of_seats.text);
      FirebaseFirestore.instance.collection('upcoming_show').doc(widget.id).update({'bookedseats': seat});
    }
    catch (e) {
      print(e);
      successfull = 0;
    }
  }
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size * 1.0;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      appBar: AppBar(title: Text("Booking Form",style: TextStyle(color: Colors.white),),backgroundColor: Colors.pink,),
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
                      "Book Ticket",
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
                        controller: c_name,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Customer Name",
                          hintStyle: const TextStyle(color: Colors.black45),
                          fillColor: MyTheme.greyColor,
                          filled: true,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.black),
                        controller: no_of_seats,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Enter No. Of Seats",
                          hintStyle: const TextStyle(color: Colors.black45),
                          fillColor: MyTheme.greyColor,
                          filled: true,
                        ),
                      ),
                    ),


                    ElevatedButton(
                      onPressed: () {

                        insertrecord();
                        if(successfull == 1)
                        {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Successfully Inserted!!!")),
                          );
                        }
                        else
                        {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Sorry Some Internal Error Is There Try After Some Time!!")),
                          );
                        }


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
                            "INSERT",
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
              // RichText(
              //   text: TextSpan(
              //     children: [
              //       const TextSpan(
              //         text: "Already have an account ? ",
              //         style: TextStyle(fontWeight: FontWeight.w700,color: Colors.white),
              //       ),
              //       TextSpan(
              //         text: "Login",
              //         style: const TextStyle(decoration: TextDecoration.underline, fontWeight: FontWeight.w700,color: Colors.white),
              //         recognizer: TapGestureRecognizer()
              //           ..onTap = () {
              //             Get.back();
              //           },
              //       ),
              //       const TextSpan(
              //         text: " here.",
              //         style: TextStyle(fontWeight: FontWeight.w700,color: Colors.white),
              //       ),
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
