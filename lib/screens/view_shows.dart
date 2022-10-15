import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:onlinemovieticket/admin/update_upcoming_show.dart';
import 'package:onlinemovieticket/ipconfig.dart';
import 'package:onlinemovieticket/screens/bookingform.dart';
import 'package:onlinemovieticket/screens/home.dart';


class view_shows extends StatefulWidget {
  // const view_shows({Key? key}) : super(key: key);

  String moviename ;

  view_shows(this.moviename);

  @override
  State<view_shows> createState() => _view_showsState();
}

class _view_showsState extends State<view_shows> {

  final CollectionReference upcoming = FirebaseFirestore.instance.collection('upcoming_show');


  @override
  Widget build(BuildContext context) {

    Query nameQuery = upcoming.where('moviename', isEqualTo: widget.moviename).orderBy('date', descending: false);

    return Scaffold(
        appBar: AppBar(title: Text("Upcoming Show",style: TextStyle(color: Colors.white),),backgroundColor: Colors.pink),
        body: StreamBuilder(
            stream:  nameQuery.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot){
              print(streamSnapshot);
              if(streamSnapshot.hasData) {
                return ListView.builder(
                    itemCount: streamSnapshot.data!.docs.length,
                    itemBuilder: (context,index){
                      final DocumentSnapshot documentSnapshot = streamSnapshot.data!.docs[index];
                      return Card(
                        clipBehavior: Clip.antiAlias,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ListTile(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>bookingform(
                                  documentSnapshot.id,
                                  documentSnapshot["moviename"],
                                  documentSnapshot["screenno"].toString(),
                                  documentSnapshot["price"].toString(),
                                  documentSnapshot["timing"],
                                  documentSnapshot["date"].toDate().toString(),
                                  documentSnapshot["bookedseats"].toString(),
                                )));
                              },
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(documentSnapshot["movieimage"]
                                  // movie.imageUrl
                                ),
                              ),
                              title: Text(documentSnapshot["moviename"],style: TextStyle(color: Colors.pink),),
                              subtitle: Text(documentSnapshot["date"].toDate().toString(),style: TextStyle(color: Colors.pinkAccent),),
                            ),
                            ListTile(
                              title: Text("Screen No. : ",
                                  style: TextStyle(color: Colors.pink)
                              ),
                              subtitle: Text(
                                documentSnapshot["screenno"].toString(),
                                style: TextStyle(color: Colors.pinkAccent.withOpacity(0.6)),
                              ),

                            ),

                            ListTile(
                              title: Text("Total Seats : ",
                                  style: TextStyle(color: Colors.pink)
                              ),
                              subtitle: Text(
                                documentSnapshot["totalseats"].toString(),
                                style: TextStyle(color: Colors.pinkAccent.withOpacity(0.6)),
                              ),
                            ),

                            ListTile(
                              title: Text("Booked Seats : ",
                                  style: TextStyle(color: Colors.pink)
                              ),
                              subtitle: Text(
                                documentSnapshot["bookedseats"].toString(),
                                style: TextStyle(color: Colors.pinkAccent.withOpacity(0.6)),
                              ),

                            ),


                            ListTile(
                              title: Text("Price : ",
                                  style: TextStyle(color: Colors.pink)
                              ),
                              subtitle: Text(
                                documentSnapshot["price"].toString(),
                                style: TextStyle(color: Colors.pinkAccent.withOpacity(0.6)),
                              ),
                            ),

                            ListTile(
                              title: Text("Timing : ",
                                  style: TextStyle(color: Colors.pink)
                              ),
                              subtitle: Text(
                                documentSnapshot["timing"],
                                style: TextStyle(color: Colors.pinkAccent.withOpacity(0.6)),
                              ),
                            ),

                            ListTile(
                              title: Text("Movie Caption : ",
                                  style: TextStyle(color: Colors.pink)
                              ),
                              subtitle: Text(
                                documentSnapshot["moviecaption"],
                                style: TextStyle(color: Colors.pinkAccent.withOpacity(0.6)),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );

            }
        )
    );
  }
}
