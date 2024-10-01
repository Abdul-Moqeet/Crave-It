// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delievery/components/widgets/custom_button.dart';
import 'package:food_delievery/models/combined_model.dart';
import 'package:food_delievery/providers/cart_items_provider.dart';
import 'package:food_delievery/providers/favourites_provider.dart';

class product_detail extends ConsumerWidget {
  const product_detail({super.key, required this.custom_index});
  final int custom_index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
     final favourites = ref.watch(favouritesProvider);
     final cart_items = ref.watch(CartProvider);
     final inCart = cart_items.contains(products_list[custom_index]);
    final isFavourite = favourites.contains(products_list[custom_index]);
    
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30.0),
            child: IconButton(
              onPressed: () {
                 final favouritesNotifier = ref.read(favouritesProvider.notifier);
                if (isFavourite) {
                  favouritesNotifier.removeFavourite(products_list[custom_index]);
                } else {
                  favouritesNotifier.addFavourite(products_list[custom_index]);
                }
              },
              icon: isFavourite
                  ? const Icon(Icons.favorite, color: Colors.pink)
                  : const Icon(Icons.favorite_outline),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Column(
            children: [
              Center(
                child:  SizedBox( 
                  height: 200,
                  width: 200,
                  child: Image.asset(
                          'assets/images/${products_list[custom_index].category}/${products_list[custom_index].image}',
                        fit: BoxFit.contain,
                        ),
                )
                    
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                products_list[custom_index].name,
                style: const TextStyle(
                  fontSize: 22,
                  fontFamily: 'SFProRounded-Regular.ttf',
                  fontWeight: FontWeight.w600,
                  letterSpacing: -1,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '\$${products_list[custom_index].price.toStringAsFixed(products_list[custom_index].price.truncateToDouble() == products_list[custom_index].price ? 0 : 2)}',
                style: const TextStyle(
                  color: Color(0xFFFA4A0C),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 50.0, right: 100),
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Description',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            letterSpacing: -.5,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        products_list[custom_index].description,
                        style: const TextStyle(
                          color: Colors.grey,
                          letterSpacing: -.8,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Return policy',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            letterSpacing: -.5,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'All our foods are double checked before leaving our stores so by any case you found a broken food please contact our hotline immediately.',
                        style: TextStyle(
                          color: Colors.grey,
                          letterSpacing: -.8,
                          height: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(child: Container()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),
            child: Column(
              children: [
                 custom_button(button_text:inCart == false ?  'Add to cart' : 'Remove from cart',
                 
                   function: () {
                  final cart_itemNotifier = ref.watch(CartProvider.notifier);
                 if(inCart == false){
                  cart_itemNotifier.addCartItems(products_list[custom_index]);
                 }else{
                  cart_itemNotifier.removeCartItems(products_list[custom_index]);
                 }
                },),
                const SizedBox(height: 10),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}
