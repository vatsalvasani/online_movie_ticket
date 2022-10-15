// @dart=2.9
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlinemovieticket/admin/update_booked_ticket.dart';
import 'package:onlinemovieticket/admin/update_upcoming_show.dart';
import 'package:onlinemovieticket/ipconfig.dart';
import 'package:http/http.dart' as http;
import 'package:onlinemovieticket/admin/update_movie_data.dart';


class view_particular_upcoming_show extends StatefulWidget {

  String moviename;
  String date1;
  String date2;

  view_particular_upcoming_show(this.moviename,this.date1,this.date2);

  @override
  State<view_particular_upcoming_show> createState() => _view_particular_upcoming_showState();
}

class _view_particular_upcoming_showState extends State<view_particular_upcoming_show> {

  final CollectionReference passedout = FirebaseFirestore.instance.collection('upcoming_show');


  Future<void> delrecord(String id) async{
    await passedout.doc(id).delete();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:
    Text('You Have Successfully Delete The Data')));
  }

  @override
  Widget build(BuildContext context) {
    Query dateQuery = passedout.where('date',isLessThan: DateTime.parse(widget.date2),isGreaterThan: DateTime.parse(widget.date1));
    Query nameQuery = dateQuery.where('moviename', isEqualTo: widget.moviename);

    return Scaffold(
      appBar: AppBar(title: Text("Upcoming Show",style: TextStyle(color: Colors.white),),backgroundColor: Colors.pink),
      body: StreamBuilder(
        stream:  nameQuery.snapshots(),
    builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot){
    print(streamSnapshot);
    if(streamSnapshot.hasData) {
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
    Navigator.push(context, MaterialPageRoute(builder: (context)=>update_upcoming_show(
    documentSnapshot.id,
    documentSnapshot["moviename"],
    documentSnapshot["screenno"].toString(),
    documentSnapshot["totalseats"].toString(),
    documentSnapshot["bookedseats"].toString(),
    documentSnapshot["price"].toString(),
    documentSnapshot["timing"],
    documentSnapshot["date"].toDate().toString(),
    documentSnapshot["moviecaption"],
    documentSnapshot["movieimage"],
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
