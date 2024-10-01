// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delievery/providers/favourites_provider.dart';

class favourites_page extends ConsumerWidget {
  const favourites_page({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favourites = ref.watch(favouritesProvider);

    return Scaffold(
      
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: const Text('Favorites'),
      ),
      body: favourites.isEmpty
          ? const Center(
              child: Text('No favorites yet!'),
            )
          : ListView.builder(
              itemCount: favourites.length,
              itemBuilder: (context, index) {
                final drink = favourites[index];
                return ListTile(
                  leading: Image.asset(
                    'assets/images/${drink.category}/${drink.image}',
                    width: 50,
                    height: 50,
                  ),
                  title: Text(drink.name),
                  subtitle: Text('\$${drink.price}'),
                );
              },
            ),
    );
  }
}
