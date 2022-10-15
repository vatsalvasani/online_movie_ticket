import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlinemovieticket/admin/admin_home.dart';
import 'package:onlinemovieticket/admin/insert_passed_out_show.dart';
import 'package:onlinemovieticket/admin/insert_upcoming_show.dart';
import 'package:onlinemovieticket/admin/view_booked_ticket_data.dart';
import 'package:onlinemovieticket/admin/insert_movie_data.dart';
import 'package:onlinemovieticket/admin/view_particular_booked_ticket_form.dart';
import 'package:onlinemovieticket/admin/view_particular_movie_data_form.dart';
import 'package:onlinemovieticket/admin/view_particular_passed_out_show_form.dart';
import 'package:onlinemovieticket/admin/view_particular_upcoming_show_form.dart';
import 'package:onlinemovieticket/admin/view_passed_out_show.dart';
import 'package:onlinemovieticket/admin/view_upcoming_show.dart';
import 'package:onlinemovieticket/admin/view_movie_data.dart';
import 'package:onlinemovieticket/screens/home.dart';
import 'package:onlinemovieticket/screens/payment.dart';
import 'pages/splash_screen.dart';
import 'utils/mytheme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // if (Firebase.apps.length == 0) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyBZ96EWraVd5-BJwtYnb7yXp4LDXHbBXvg",
        appId: "1:771881495015:android:84e10a4f9eba57913db542",
        messagingSenderId: "771881495015",
        projectId: "movie-ticket-booking-app-f4e0b",
      ),
    );
  // }else {
  //   Firebase.app(); // if already initialized, use that one
  // }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: MyTheme.myLightTheme,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
