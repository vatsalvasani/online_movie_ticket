// @dart=2.9
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:onlinemovieticket/ipconfig.dart';
import 'package:http/http.dart' as http;
import 'package:onlinemovieticket/admin/update_movie_data.dart';


class view_detail_movie extends StatefulWidget {

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

  view_detail_movie(this.id,this.movie_name,this.release_date,this.review,this.total_collection,this.last_date,this.movie_caption,this.movie_image,this.actor1, this.actor2,this.actor3,this.director,this.singer,this.producer,this.composer,this.actor1_caption,this.actor1_image,this.actor2_caption,this.actor2_image,this.actor3_caption,this.actor3_image);

  @override
  State<view_detail_movie> createState() => _view_detail_movieState();
}

class _view_detail_movieState extends State<view_detail_movie> {

  String id;
  @override
  void initState() {
    id = widget.id;
    print(id);
  }
  final CollectionReference viewmovie = FirebaseFirestore.instance.collection('movies');

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size * 1.23;
    return Scaffold(
      appBar: AppBar(title: Text("Detail Movie Data",style: TextStyle(color: Colors.white),),backgroundColor: Colors.pink),

      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: viewmovie.doc(id).snapshots(),
    builder: (_, snapshot){
    if(snapshot.hasData) {
    return ListView.builder(
          itemCount: 1,
          itemBuilder: (context,index)
          {
            var documentSnapshot = snapshot.data.data();
            return Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>update_movie_data(
                        id,
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
