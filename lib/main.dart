import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_first_flutter/watchlist.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';
import 'movie_home_page.dart';

void main() async {
  runApp( MyApp(model: Datastore(),));
}

class MyApp extends StatelessWidget {

  final Datastore model;

  const MyApp({super.key, required this.model});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  ScopedModel(
      model: model,
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashPage(),
      ),
    );
  }}

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  static const String Key = 'Login';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    whereToGo();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }

  void whereToGo() async{
    var sharedPref = await SharedPreferences.getInstance();
    var isLoggedIn = sharedPref.getBool(Key);
    Timer( const Duration( seconds: 2), () {
      if ( isLoggedIn!=null){
        if (isLoggedIn){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
        } else{
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>LoginPage()));
        }
      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>LoginPage()));
      }
    });
  }
}




















