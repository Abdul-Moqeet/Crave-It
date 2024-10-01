// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:food_delievery/components/widgets/bottom_navbar.dart';
import 'package:food_delievery/components/widgets/products_cards.dart';
import 'package:food_delievery/models/category_model.dart';
import 'package:food_delievery/models/combined_model.dart';
import 'package:food_delievery/view/start/main_pages/cart_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String isSelected = 'Foods';
  int nav_index = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // Filter products based on selected category
    List<products_model> filteredProducts = products_list
        .where((product) => product.category == isSelected.toLowerCase())
        .toList();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(30),
        child: AppBar(
        forceMaterialTransparency: true,
          actions: [
          IconButton(icon: const Icon(Icons.shopping_cart_outlined), onPressed: () {
             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> cart_page()));
          },)
        ],),
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.only(left: 45, right: 30, top: 40),
              width: 200,
              child: const Text(
                'Delicious food for you',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'SFProRounded-Regular.ttf',
                    ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
                // color: const Color.fromARGB(255, 233, 233, 233),
                borderRadius: BorderRadius.circular(40)),
            child: const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Center(
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      contentPadding: EdgeInsets.only(top: 12),
                      hintText: 'Search',
                      hintStyle: TextStyle(
                          fontFamily: 'SFProRounded-Rectangular.ttf',
                          fontSize: 18),
                      border: InputBorder.none),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: size.width,
            height: 60,
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 40),
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.none,
              itemCount: category_list.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          isSelected = category_list[index].category_name;
                        });
                      },
                      child: Text(
                        category_list[index].category_name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color:
                                isSelected == category_list[index].category_name
                                    ? const Color(0xFFFA4A0C)
                                    : DefaultTextStyle.of(context).style.color),
                      ),
                    ),
                    isSelected == category_list[index].category_name
                        ? const SizedBox(
                            height: 1,
                            width: 80,
                            child: Divider(
                              color: Color(0xFFFA4A0C),
                              thickness: 3,
                            ),
                          )
                        : const SizedBox(height: 1)
                  ],
                );
              },
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 40.0),
              scrollDirection: Axis.horizontal,
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                return products_card(
                  product: filteredProducts[index],
                );
              },
            ),
          ),
        ],
      ),
       bottomNavigationBar: const bottom_navbar(),
    );
  }
}

