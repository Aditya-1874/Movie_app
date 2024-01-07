import 'package:flutter/material.dart';
import 'box.dart';
import 'button.dart';

import 'square.dart';

class LoginPage extends StatelessWidget {
   LoginPage({super.key});


  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey.shade300,
      body:  SafeArea(
        child:  Center(
          child:  Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              const SizedBox(height: 10,),
              const Icon(Icons.lock,
                 size: 80,
                 shadows: <Shadow>[Shadow(color: Colors.black, blurRadius: 10.0)],

              ),

              const SizedBox(height:25),

              Text( 'Welcome Back You Were Missed!!!',
                    style: TextStyle( fontSize:20, color: Colors.grey[700]),),

              const SizedBox(height:15),


              MyBox(
                controller: usernameController,
                hintText: 'Username',
                obscureText: false,
              ),

              const SizedBox(height:5),



              MyBox(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              const SizedBox(height:10),


              const Padding(
                padding:  EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Forgot Password?'),
                  ],
                ),
              ),


              const SizedBox(height:10),


              const Button(),


              const SizedBox(height:10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                        child: Divider(
                          thickness: 0.5,
                            color: Colors.grey[400],
                        )),


                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text('or Continue with',
                      style: TextStyle(
                        color: Colors.grey[700]
                      ),),
                    ),


                    Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ))
                  ],
                ),
              ),

              const SizedBox(height:5),

              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SquareTile(imagePath: 'lib/images/google.png'),

                  SizedBox(width: 25,),

                  SquareTile(imagePath: 'lib/images/apple.png')
                ],
              ),

              const SizedBox(height:5),


              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Not a Member?'),
                   SizedBox(width: 4,),
                  Text('Register Now!', style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),)
                ],
              ),
            ],
             ),),
        ),
      );
    
  }}