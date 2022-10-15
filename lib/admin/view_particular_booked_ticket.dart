
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:onlinemovieticket/admin/update_booked_ticket.dart';
import 'package:onlinemovieticket/ipconfig.dart';
import 'package:http/http.dart' as http;
import 'package:onlinemovieticket/admin/update_movie_data.dart';


class view_particular_booked_ticket extends StatefulWidget {

  String moviename;
  String date1;
  String date2;

  view_particular_booked_ticket(this.moviename,this.date1,this.date2);

  @override
  State<view_particular_booked_ticket> createState() => _view_particular_booked_ticketState();
}

class _view_particular_booked_ticketState extends State<view_particular_booked_ticket> {

  final CollectionReference viewmovie = FirebaseFirestore.instance.collection('booked_ticket');

  Future<void> delrecord(String id) async {
    await viewmovie.doc(id).delete();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:
    Text('You Have Successfully Delete The Data')));
  }

  @override
  Widget build(BuildContext context) {
    Query dateQuery = viewmovie.where('date',isLessThan: DateTime.parse(widget.date2),isGreaterThan: DateTime.parse(widget.date1));
    Query nameQuery = dateQuery.where('m_name', isEqualTo: widget.moviename);

    final Size _size = MediaQuery.of(context).size * 1.23;
    return Scaffold(
      appBar: AppBar(title: Text("Booked Ticket Data",style: TextStyle(color: Colors.white),),backgroundColor: Colors.pink),
      body: StreamBuilder(
        stream:  nameQuery.snapshots(),

    builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot){
          print(streamSnapshot);
    if(streamSnapshot.hasData) {
    return ListView.builder(
    itemCount: streamSnapshot.data!.docs.length,
    itemBuilder: (context,index)
    {
    final DocumentSnapshot documentSnapshot = streamSnapshot.data!.docs[index];
            return Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ListTile(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>update_booked_ticket(
    documentSnapshot.id,
    documentSnapshot["c_name"],
    documentSnapshot["m_name"],
    documentSnapshot["date"].toDate().toString(),
    documentSnapshot["price"].toString(),
    documentSnapshot["timing"],
    documentSnapshot["screenno"].toString(),
    documentSnapshot["seatno"],
    documentSnapshot["no_of_seats"].toString(),
    )));
                    },
                    leading: Icon(CupertinoIcons.person,color:Colors.pinkAccent),
                    title: Text(documentSnapshot["c_name"],
                        style: TextStyle(color: Colors.pink)
                    ),
                    subtitle: Text(
    documentSnapshot["m_name"],
                      style: TextStyle(color: Colors.pinkAccent.withOpacity(0.6)),
                    ),
                  ),
                  ListTile(
                    title: Text("Date : ",
                        style: TextStyle(color: Colors.pink)
                    ),
                    subtitle: Text(
                    documentSnapshot["date"].toDate().toString(),
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
                    title: Text("Seat Numbers : ",
                        style: TextStyle(color: Colors.pink)
                    ),
                    subtitle: Text(
    documentSnapshot["seatno"],
                      style: TextStyle(color: Colors.pinkAccent.withOpacity(0.6)),
                    ),
                  ),

                  ListTile(
                    title: Text("No. Of Seats : ",
                        style: TextStyle(color: Colors.pink)
                    ),
                    subtitle: Text(
    documentSnapshot["no_of_seats"].toString(),
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
