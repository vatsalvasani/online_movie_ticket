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

import 'admin_home.dart';
import 'insert_passed_out_show.dart';
import 'insert_upcoming_show.dart';



class insert_movie_data extends StatefulWidget {
  const insert_movie_data({Key? key}) : super(key: key);

  @override
  State<insert_movie_data> createState() => _insert_movie_dataState();
}

class _insert_movie_dataState extends State<insert_movie_data> {
  var successfull = 1;
  TextEditingController moviename = TextEditingController();
  TextEditingController releasedate = TextEditingController();
  TextEditingController review = TextEditingController();
  TextEditingController totalcollection = TextEditingController();
  TextEditingController lastdate = TextEditingController();
  TextEditingController moviecaption = TextEditingController();
  TextEditingController movieimage = TextEditingController();
  TextEditingController actor1 = TextEditingController();
  TextEditingController actor2 = TextEditingController();
  TextEditingController actor3 = TextEditingController();
  TextEditingController director = TextEditingController();
  TextEditingController singer = TextEditingController();
  TextEditingController producer = TextEditingController();
  TextEditingController composer = TextEditingController();
  TextEditingController actor1_caption = TextEditingController();
  TextEditingController actor1_image = TextEditingController();
  TextEditingController actor2_caption = TextEditingController();
  TextEditingController actor2_image = TextEditingController();
  TextEditingController actor3_caption = TextEditingController();
  TextEditingController actor3_image = TextEditingController();

  // String uri = ipcon+"movieticket_api/insert_movie_data.php";

  Future<void> insertrecord() async {
    final CollectionReference docMovie = FirebaseFirestore.instance.collection(
        'movies');
    try {
      await docMovie.add({
        "moviename": moviename.text,
        "releasedate": Timestamp.fromDate(DateTime.parse(releasedate.text)),
        "review": double.parse(review.text),
        "totalcollection": int.parse(totalcollection.text),
        "lastdate": Timestamp.fromDate(DateTime.parse(lastdate.text)),
        "moviecaption": moviecaption.text,
        "movieimage": movieimage.text,
        "actor1": actor1.text,
        "actor2": actor2.text,
        "actor3": actor3.text,
        "director": director.text,
        "singer": singer.text,
        "producer": producer.text,
        "composer": composer.text,
        "actor1caption": actor1_caption.text,
        "actor1image": actor1_image.text,
        "actor2caption": actor2_caption.text,
        "actor2image": actor2_image.text,
        "actor3caption": actor3_caption.text,
        "actor3image": actor3_image.text
      });
    }
    catch (e) {
      print(e);
      successfull = 0;
    }
  }
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size * 3.0;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      appBar: AppBar(title: Text("Movie Data",style: TextStyle(color: Colors.white),),backgroundColor: Colors.pink,),
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
                      "Add Movie Data",
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
                      controller: releasedate,
                      //editing controller of this TextField
                      decoration: InputDecoration(
                          icon: Icon(Icons.calendar_today), //icon of text field
                          labelText: "Enter Release Date" //label text of field
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
                            releasedate.text =
                                formattedDate; //set output date to TextField value.
                          });
                        } else {
                          print("Date is not selected");
                        }
                      },
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.black),
                        controller: review,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Review",
                          hintStyle: const TextStyle(color: Colors.black45),
                          fillColor: MyTheme.greyColor,
                          filled: true,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.black),
                        controller: totalcollection,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Total Collection",
                          hintStyle: const TextStyle(color: Colors.black45),
                          fillColor: MyTheme.greyColor,
                          filled: true,
                        ),
                      ),
                    ),

                    TextField(
                      style: TextStyle(color: Colors.pinkAccent),
                      controller: lastdate,
                      //editing controller of this TextField
                      decoration: InputDecoration(
                          icon: Icon(Icons.calendar_today), //icon of text field
                          labelText: "Enter Last Date" //label text of field
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
                            lastdate.text =
                                formattedDate; //set output date to TextField value.
                          });
                        } else {
                          print("Date is not selected");
                        }
                      },
                    ),


                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.black),
                        controller: moviecaption,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Movie Caption",
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
                        controller: movieimage,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Movie Image Url",
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
                        controller: actor1,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Actor1",
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
                        controller: actor2,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Actor2",
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
                        controller: actor3,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Actor3",
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
                        controller: director,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Director",
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
                        controller: singer,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Singer",
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
                        controller: producer,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Producer",
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
                        controller: composer,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Composer",
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
                        controller: actor1_caption,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Actor1 Caption",
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
                        controller: actor1_image,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Actor1 Image",
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
                        controller: actor2_caption,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Actor2 Caption",
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
                        controller: actor2_image,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Actor2 Image",
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
                        controller: actor3_caption,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Actor3 Caption",
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
                        controller: actor3_image,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Actor3 Image",
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
