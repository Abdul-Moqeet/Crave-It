import 'package:flutter/material.dart';
import 'package:food_delievery/models/combined_model.dart';
import 'package:food_delievery/view/start/main_pages/products_detail.dart';

class products_card extends StatelessWidget {
  final products_model product;

  const products_card({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => product_detail(custom_index: products_list.indexOf(product))));
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Card(
                  // color: Theme.of(context).colorScheme.surface,
                  elevation: 2,
                  child: SizedBox(
                    width: 200,
                    height: 250,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 120,
                        ),
                        SizedBox(
                          width: 120,
                          child: Text(
                            product.name,
                            softWrap: true,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'SFProRounded-Regular.ttf'),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          '\$${product.price.toStringAsFixed(product.price.truncateToDouble() == product.price ? 0 : 2)}',

                          style: const TextStyle(
                              fontFamily: 'SFProRounded-Regular.ttf',
                              fontSize: 20,
                              color: Color(0xFFFA4A0C),
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              right: 30,
              child: Container(
                height: 150,
                width: 150,
                decoration: const BoxDecoration(),
                child: Image.asset(
                  'assets/images/${product.category}/${product.image}',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
