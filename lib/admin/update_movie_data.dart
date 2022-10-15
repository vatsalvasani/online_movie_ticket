// @dart=2.9
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:onlinemovieticket/admin/view_movie_data.dart';
import 'package:onlinemovieticket/ipconfig.dart';
import 'package:http/http.dart' as http;
import 'package:onlinemovieticket/utils/mytheme.dart';
import 'package:flutter_svg/flutter_svg.dart';


class update_movie_data extends StatefulWidget {

  String id;
  String movie_name;
  String release_date;
  String review;
  String total_collection;
  String last_date;
  String movie_caption;
  String movie_image;
  String actor1;
  String actor2;
  String actor3;
  String director;
  String singer;
  String producer;
  String composer;
  String actor1_caption;
  String actor1_image;
  String actor2_caption;
  String actor2_image;
  String actor3_caption;
  String actor3_image;


  update_movie_data(this.id,this.movie_name,this.release_date,this.review,this.total_collection,this.last_date,this.movie_caption,this.movie_image,this.actor1, this.actor2,this.actor3,this.director,this.singer,this.producer,this.composer,this.actor1_caption,this.actor1_image,this.actor2_caption,this.actor2_image,this.actor3_caption,this.actor3_image);

  @override
  State<update_movie_data> createState() => _update_movie_dataState();
}

class _update_movie_dataState extends State<update_movie_data> {

  final CollectionReference updatemovie = FirebaseFirestore.instance.collection('movies');

  TextEditingController movie_name = TextEditingController();
  TextEditingController release_date = TextEditingController();
  TextEditingController review = TextEditingController();
  TextEditingController total_collection = TextEditingController();
  TextEditingController last_date = TextEditingController();
  TextEditingController actor1 = TextEditingController();
  TextEditingController actor2 = TextEditingController();
  TextEditingController actor3 = TextEditingController();
  TextEditingController director = TextEditingController();
  TextEditingController singer = TextEditingController();
  TextEditingController producer = TextEditingController();
  TextEditingController composer = TextEditingController();

  Future<void> updaterecord() async{
    String id = widget.id;

    await updatemovie .doc(id).update({"moviename" : movie_name.text,
      "releasedate" : Timestamp.fromDate(DateTime.parse(release_date.text)),
      "review" : double.parse(review.text),
      "totalcollection" : int.parse(total_collection.text),
      "lastdate" : Timestamp.fromDate(DateTime.parse(last_date.text)),
      "actor1" : actor1.text,
      "actor2" : actor2.text,
      "actor3" : actor3.text,
      "director" : director.text,
      "singer" : singer.text,
      "producer" : producer.text,
      "composer" : composer.text,

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    movie_name.text = widget.movie_name;
    release_date.text = widget.release_date;
    review.text = widget.review;
    total_collection.text = widget.total_collection;
    last_date.text = widget.last_date;
    actor1.text = widget.actor1;
    actor2.text = widget.actor2;
    actor3.text = widget.actor3;
    director.text = widget.director;
    singer.text = widget.singer;
    producer.text = widget.producer;
    composer.text = widget.composer;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size * 2.0;
    return Scaffold(
      backgroundColor: MyTheme.splash.withOpacity(0.5),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text('Update Movie Data'),backgroundColor: Colors.pink),
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
                        controller: movie_name,
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
                        controller: release_date,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Release Date",
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

                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.black),
                        controller: last_date,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Last Date",
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
                          hintText: "Actor 1",
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
                          hintText: "Actor 2",
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
                          hintText: "Actor 3",
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
