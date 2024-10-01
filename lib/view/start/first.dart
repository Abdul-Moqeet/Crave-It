// ignore_for_file: camel_case_types

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_delievery/components/widgets/custom_button.dart';
import 'package:food_delievery/view/start/login.dart';

class first_page extends StatelessWidget {
  const first_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40, top: 60),
            child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white,
                child: Image.asset(
                  'assets/images/logo.png',
                )),
          ),
          const SizedBox(height: 10),
          Container(
            width: 300,
            padding: const EdgeInsets.only(left: 40),
            child: const Text(
              'Food for Everyone',
              style: TextStyle(
                  height: 1,
                  fontFamily: 'SFProRounded',
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: FontWeight.w900),
            ),
          ),
          Stack(
            children: [
              Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 110.0),
                    child: Image.asset(
                      'assets/images/ToyFaces1.png',
                      height: 320,
                    ),
                  )),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Image.asset(
                    'assets/images/ToyFaces2.png',
                    height: 400,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 200,
                  // Specify height
                  width: double
                      .infinity, // Stretch the container to the full width
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.red, // Red color
                        Colors.red.withOpacity(0.0), // Transparent red color
                      ],
                      stops: [
                        0.0,
                        1.0
                      ], // Define the position of each color stop
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
              )
            ],
          ),
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 30.0),
           child: custom_button(button_text: 'Get Started', function: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const Login()));
           }),
         )
        ],
      ),
    );
  }
}
