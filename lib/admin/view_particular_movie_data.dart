// @dart=2.9
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlinemovieticket/admin/update_booked_ticket.dart';
import 'package:onlinemovieticket/ipconfig.dart';
import 'package:http/http.dart' as http;
import 'package:onlinemovieticket/admin/update_movie_data.dart';


class view_particular_movie_data extends StatefulWidget {

  String total_collection;
  String review1;
  String review2;

  view_particular_movie_data(this.total_collection,this.review1,this.review2);

  @override
  State<view_particular_movie_data> createState() => _view_particular_movie_dataState();
}

class _view_particular_movie_dataState extends State<view_particular_movie_data> {

  final CollectionReference viewmovie = FirebaseFirestore.instance.collection('movies');


  Future<void> delrecord(String id) async{

    await viewmovie.doc(id).delete();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:
    Text('You Have Successfully Delete The Data')));
  }


  @override
  Widget build(BuildContext context) {
    Query collectionQuery = viewmovie.where('totalcollection',isEqualTo: int.parse(widget.total_collection));
    Query reviewQuery = collectionQuery.where('review', isGreaterThanOrEqualTo: double.parse(widget.review1),isLessThanOrEqualTo: double.parse(widget.review2));

    final Size _size = MediaQuery.of(context).size * 1.23;
    return Scaffold(
      appBar: AppBar(title: Text("Detail Movie Data",style: TextStyle(color: Colors.white),),backgroundColor: Colors.pink),
      body: StreamBuilder(
        stream: reviewQuery.snapshots(),
    builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot){
          print(streamSnapshot);
    if(streamSnapshot.hasData) {
    return ListView.builder(
    itemCount: streamSnapshot.data.docs.length,
    itemBuilder: (context, index) {
    final DocumentSnapshot documentSnapshot = streamSnapshot.data.docs[index];
            return Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>update_movie_data(
    documentSnapshot.id,
    documentSnapshot["moviename"],
    documentSnapshot["releasedate"].toDate().toString(),
    documentSnapshot["review"].toString(),
    documentSnapshot["totalcollection"].toString(),
    documentSnapshot["lastdate"].toDate().toString(),
    documentSnapshot["moviecaption"],
    documentSnapshot["movieimage"],
    documentSnapshot["actor1"],
    documentSnapshot["actor2"],
    documentSnapshot["actor3"],
    documentSnapshot["director"],
    documentSnapshot["singer"],
    documentSnapshot["producer"],
    documentSnapshot["composer"],
    documentSnapshot["actor1caption"],
    documentSnapshot["actor1image"],
    documentSnapshot["actor2caption"],
    documentSnapshot["actor2image"],
    documentSnapshot["actor3caption"],
    documentSnapshot["actor3image"],
                      )));
                    },
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(documentSnapshot["movieimage"]
                        // movie.imageUrl
                      ),
                    ),
                    title: Text(documentSnapshot["moviename"],style: TextStyle(color: Colors.blueGrey),),
                    subtitle: Text(documentSnapshot["review"].toString(),style: TextStyle(color: Colors.pinkAccent),),
                  ),

                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(documentSnapshot["actor1image"]
                        // movie.imageUrl
                      ),
                    ),
                    title: Text(documentSnapshot["actor1"],style: TextStyle(color: Colors.pink),),
                  ),

                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(documentSnapshot["actor2image"]
                        // movie.imageUrl
                      ),
                    ),
                    title: Text(documentSnapshot["actor2"],style: TextStyle(color: Colors.pink),),
                  ),

                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(documentSnapshot["actor3image"]
                        // movie.imageUrl
                      ),
                    ),
                    title: Text(documentSnapshot["actor3"],style: TextStyle(color: Colors.pink),),
                  ),


                  ListTile(
                    title: Text("Release Date : ",
                        style: TextStyle(color: Colors.pink)
                    ),
                    subtitle: Text(
    documentSnapshot["releasedate"].toDate().toString(),
                      style: TextStyle(color: Colors.pinkAccent.withOpacity(0.6)),
                    ),
                  ),

                  ListTile(
                    title: Text("Total Collection : ",
                        style: TextStyle(color: Colors.pink)
                    ),
                    subtitle: Text(
                    documentSnapshot["totalcollection"].toString(),
                      style: TextStyle(color: Colors.pinkAccent.withOpacity(0.6)),
                    ),
                  ),

                  ListTile(
                    title: Text("Last Date : ",
                        style: TextStyle(color: Colors.pink)
                    ),
                    subtitle: Text(
    documentSnapshot["lastdate"].toDate().toString(),
                      style: TextStyle(color: Colors.pinkAccent.withOpacity(0.6)),
                    ),
                  ),



                  ListTile(
                    title: Text("Director : ",
                        style: TextStyle(color: Colors.pink)
                    ),
                    subtitle: Text(
    documentSnapshot["director"],
                      style: TextStyle(color: Colors.pinkAccent.withOpacity(0.6)),
                    ),
                  ),

                  ListTile(
                    title: Text("Singer : ",
                        style: TextStyle(color: Colors.pink)
                    ),
                    subtitle: Text(
    documentSnapshot["singer"],
                      style: TextStyle(color: Colors.pinkAccent.withOpacity(0.6)),
                    ),
                  ),

                  ListTile(
                    title: Text("Producer : ",
                        style: TextStyle(color: Colors.pink)
                    ),
                    subtitle: Text(
    documentSnapshot["producer"],
                      style: TextStyle(color: Colors.pinkAccent.withOpacity(0.6)),
                    ),
                  ),

                  ListTile(
                    title: Text("Composer : ",
                        style: TextStyle(color: Colors.pink)
                    ),
                    subtitle: Text(
    documentSnapshot["composer"],
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
