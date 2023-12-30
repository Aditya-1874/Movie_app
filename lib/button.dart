import 'package:flutter/material.dart';
import 'package:my_first_flutter/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'movie_home_page.dart';



class Button extends StatelessWidget {


  const Button({super.key,});




  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
      var sharedPref = await SharedPreferences.getInstance();
      sharedPref.setBool(SplashPageState.Key, true);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const HomePage();
      }));},
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25.0),
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8.0)
        ),
      
        child : const Center (
          child: Text(
            'Sign In',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold
            ) ),
      
      
        )
      
      
      ),
    );}}



