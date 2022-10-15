// @dart=2.9
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlinemovieticket/admin/update_booked_ticket.dart';
import 'package:onlinemovieticket/admin/update_passed_out_show.dart';
import 'package:onlinemovieticket/admin/update_upcoming_show.dart';
import 'package:onlinemovieticket/ipconfig.dart';
import 'package:http/http.dart' as http;
import 'package:onlinemovieticket/admin/update_movie_data.dart';


class view_particular_passed_out_show extends StatefulWidget {

  String moviename;
  String date_1;
  String date_2;

  view_particular_passed_out_show(this.moviename,this.date_1,this.date_2);

  @override
  State<view_particular_passed_out_show> createState() => _view_particular_passed_out_showState();
}

class _view_particular_passed_out_showState extends State<view_particular_passed_out_show> {

  final CollectionReference passedout = FirebaseFirestore.instance.collection('passed_out_show');


  Future<void> delrecord(String id) async{
    await passedout.doc(id).delete();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:
    Text('You Have Successfully Delete The Data')));
  }

  @override
  Widget build(BuildContext context) {
    Query dateQuery = passedout.where('date',isLessThan: DateTime.parse(widget.date_2),isGreaterThan: DateTime.parse(widget.date_1));
    Query nameQuery = dateQuery.where('moviename', isEqualTo: widget.moviename);

    return Scaffold(
      appBar: AppBar(title: Text("Passed Out Shows",style: TextStyle(color: Colors.white),),backgroundColor: Colors.pink),
      body: StreamBuilder(
        stream:  nameQuery.snapshots(),
    builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot){
    print(streamSnapshot);
    if(streamSnapshot.hasData) {
      print("vatsal");
    return ListView.builder(
          itemCount: streamSnapshot.data.docs.length,
          itemBuilder: (context,index){
    final DocumentSnapshot documentSnapshot = streamSnapshot.data.docs[index];
            return Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ListTile(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>update_passed_out_show(
    documentSnapshot.id,
    documentSnapshot["moviename"],
    documentSnapshot["screenno"].toString(),
    documentSnapshot["totalseats"].toString(),
    documentSnapshot["bookedseats"].toString(),
    documentSnapshot["price"].toString(),
    documentSnapshot["total_collection"].toString(),
    documentSnapshot["timing"],
    documentSnapshot["moviecaption"],
    documentSnapshot["movieimage"],
    documentSnapshot["date"].toDate().toString(),
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
                    title: Text("Total Collection : ",
                        style: TextStyle(color: Colors.pink)
                    ),
                    subtitle: Text(
    documentSnapshot["total_collection"].toString(),
                      style: TextStyle(color: Colors.pinkAccent.withOpacity(0.6)),
                    ),
                  ),

                  ListTile(
                    title: Text("Timing : ",
                        style: TextStyle(color: Colors.pink)
                    ),
                    subtitle: Text(
    documentSnapshot["timing"].toString(),
                      style: TextStyle(color: Colors.pinkAccent.withOpacity(0.6)),
                    ),
                  ),

                  ListTile(
                    title: Text("Movie Caption : ",
                        style: TextStyle(color: Colors.pink)
                    ),
                    subtitle: Text(
    documentSnapshot["moviecaption"].toString(),
                      style: TextStyle(color: Colors.pinkAccent.withOpacity(0.6)),
                    ),
                    trailing: IconButton(
                      icon : Icon(CupertinoIcons.delete,color: Colors.pink),
                      onPressed: (){
                        delrecord((documentSnapshot["id"]).toString());
                      },),
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