// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:food_delievery/view/start/main_pages/cart_page.dart';
import 'package:food_delievery/view/start/main_pages/profile.dart';
import 'package:food_delievery/view/start/main_pages/settings.dart';

class side_menu extends StatefulWidget {
  const side_menu({super.key});

  @override
  State<side_menu> createState() => _side_menuState();
}

class _side_menuState extends State<side_menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 251, 83, 21),
      body: SizedBox(
          width: 300,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: Container()),
               GestureDetector(
                onTap: () {
                     Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const profile_page()));
                },
                child: const ListTile(
                  leading:
                  Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                      title: Text('Profile',
                    style: TextStyle(color: Colors.white),),
                  ),
              
                ),
              
              GestureDetector(
                onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => cart_page()));
                },
                child: const ListTile(
                  leading:
                  Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.white,
                    ),
                      title: Text('orders',
                    style: TextStyle(color: Colors.white),),
                  ),
              
                ),
                GestureDetector(
                onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const profile_page()));
                },
                child: const ListTile(
                  leading:
                  Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                      title: Text('Favourites',
                    style: TextStyle(color: Colors.white),),
                  ),
              
                ),
                 GestureDetector(
                onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context)=> Settings()));
                },
                child: const ListTile(
                  leading:
                  Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                      title: Text('Settings',
                    style: TextStyle(color: Colors.white),),
                  ),
              
                ),
                 Expanded(child: Container()),
              TextButton(onPressed: (){}, child: const Row(
                children: [
                  SizedBox(width: 40,),
                  Text('Sign-out',
                  style: TextStyle(color: Colors.white, fontSize: 16),),
                  Icon(Icons.arrow_forward, color: Colors.white,)
                ],
              )),
              const SizedBox(height: 70,)
                ],
              ),
          
             
            
          ));
    
  }
}
