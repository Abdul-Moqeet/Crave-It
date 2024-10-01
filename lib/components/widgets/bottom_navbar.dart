import 'package:flutter/material.dart';
import 'package:food_delievery/view/start/Navigation.dart';
import 'package:food_delievery/view/start/main_pages/cart_page.dart';
import 'package:food_delievery/view/start/main_pages/favourites_page.dart';
import 'package:food_delievery/view/start/main_pages/profile.dart';

class bottom_navbar extends StatelessWidget {
  const bottom_navbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
     currentIndex: 0,
     
     selectedFontSize: 0,
     unselectedFontSize: 0,
     iconSize: 30,
     showSelectedLabels: false,
     showUnselectedLabels: false,
     elevation: 0,
     items:  [
       BottomNavigationBarItem(
         icon: IconButton(icon: Icon(Icons.home), onPressed: () {
           Navigator.push(context, MaterialPageRoute(builder: (context)=> Navigation_page()));
         },),
         label: 'Home',
       ),
       BottomNavigationBarItem(
          icon: IconButton(icon: Icon(Icons.favorite_outline), onPressed: () {
           Navigator.push(context, MaterialPageRoute(builder: (context)=> favourites_page()));
         },),
         label: 'Favourites',
       ),
       BottomNavigationBarItem(
        icon: IconButton(icon: Icon(Icons.person_outline), onPressed: () {
           Navigator.push(context, MaterialPageRoute(builder: (context)=> profile_page()));
         },),
         label: 'Profile',
       ),
       BottomNavigationBarItem(
          icon: IconButton(icon: Icon(Icons.history_rounded), onPressed: () {
           Navigator.push(context, MaterialPageRoute(builder: (context)=> cart_page()));
         },),
         label: 'Recents',
       ),
     ],
     type: BottomNavigationBarType.fixed,
     backgroundColor: Colors.transparent,
     selectedItemColor: const Color(0xFFFA4A0C),
     unselectedItemColor: const Color(0xFFADADAF),
          );
  }
}
