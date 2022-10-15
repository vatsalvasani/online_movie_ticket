// @dart=2.9
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:onlinemovieticket/admin/view_passed_out_show.dart';
import 'package:onlinemovieticket/admin/view_upcoming_show.dart';
import 'package:onlinemovieticket/ipconfig.dart';
import 'package:http/http.dart' as http;
import 'package:onlinemovieticket/admin/view_booked_ticket_data.dart';
import 'package:onlinemovieticket/utils/mytheme.dart';
import 'package:flutter_svg/flutter_svg.dart';


class update_passed_out_show extends StatefulWidget {

  String id;
  String moviename;
  String screenno;
  String totalseats;
  String bookedseats;
  String price;
  String total_collection;
  String timing;
  String date;
  String moviecaption;
  String movieimage;

  update_passed_out_show(this.id,this.moviename,this.screenno, this.totalseats,this.bookedseats,this.price, this.total_collection, this.timing,this.moviecaption,this.movieimage,this.date);

  @override
  State<update_passed_out_show> createState() => _update_passed_out_showState();
}

class _update_passed_out_showState extends State<update_passed_out_show> {
  final CollectionReference updatemovie = FirebaseFirestore.instance.collection('passed_out_show');

  TextEditingController moviename = TextEditingController();
  TextEditingController screenno = TextEditingController();
  TextEditingController totalseats = TextEditingController();
  TextEditingController bookedseats = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController total_collection = TextEditingController();
  TextEditingController timing = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController moviecaption = TextEditingController();
  TextEditingController movieimage = TextEditingController();

  Future<void> updaterecord() async{
    String id = widget.id;
    await updatemovie .doc(id).update({
      "moviename" : moviename.text,
      "screenno" : int.parse(screenno.text),
      "totalseats" : int.parse(totalseats.text),
      "bookedseats" : int.parse(bookedseats.text),
      "price" : int.parse(price.text),
      "totalcollection" : int.parse(total_collection.text),
      "timing" : timing.text,
      "moviecaption" : moviecaption.text,
      "movieimage" : movieimage.text,
      "date" : Timestamp.fromDate(DateTime.parse(date.text))
      });
  }

  @override
  void initState() {
    // TODO: implement initState
    moviename.text = widget.moviename;
    screenno.text = widget.screenno;
    totalseats.text = widget.totalseats;
    bookedseats.text = widget.bookedseats;
    price.text = widget.price;
    total_collection.text = widget.total_collection;
    timing.text = widget.timing;
    moviecaption.text = widget.moviecaption;
    movieimage.text = widget.movieimage;
    date.text = widget.date;

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size * 1.60;
    return Scaffold(
      backgroundColor: MyTheme.splash.withOpacity(0.5),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text('Update Passed Out Show Data'),backgroundColor: Colors.pink),
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
                      "Update The Data",
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
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.black),
                        controller: screenno,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Screen No.",
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
                        controller: totalseats,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Total Seats",
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
                        controller: bookedseats,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Booked Seats",
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
                        controller: price,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Price",
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
                        controller: total_collection,
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

                    Container(
                        height:50,
                        child:Center(
                            child:TextField(
                              style: TextStyle(color: Colors.pinkAccent),

                              controller: timing, //editing controller of this TextField
                              decoration: InputDecoration(
                                  icon: Icon(Icons.timer), //icon of text field
                                  labelText: "Enter Time" //label text of field
                              ),
                              readOnly: true,  //set it true, so that user will not able to edit text
                              onTap: () async {
                                TimeOfDay pickedTime =  await showTimePicker(
                                  initialTime: TimeOfDay.now(),
                                  context: context,
                                );

                                if(pickedTime != null ){
                                  print(pickedTime.format(context));   //output 10:51 PM
                                  DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());
                                  //converting to DateTime so that we can further format on different pattern.
                                  print(parsedTime); //output 1970-01-01 22:53:00.000
                                  String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);
                                  print(formattedTime); //output 14:59:00
                                  //DateFormat() is from intl package, you can format the time on any pattern you need.

                                  setState(() {
                                    timing.text = formattedTime; //set the value of text field.
                                  });
                                }else{
                                  print("Time is not selected");
                                }
                              },
                            )
                        )
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
                          hintText: "Movie Image",
                          hintStyle: const TextStyle(color: Colors.black45),
                          fillColor: MyTheme.greyColor,
                          filled: true,
                        ),
                      ),
                    ),



                    ElevatedButton(
                      onPressed: () {

                        updaterecord();


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
                            "UPDATE",
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
