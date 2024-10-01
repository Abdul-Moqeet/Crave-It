import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delievery/components/widgets/custom_button.dart';
import 'package:food_delievery/providers/cart_items_provider.dart';
import 'package:food_delievery/view/start/main_pages/Checkout.dart';

class cart_page extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(CartProvider);
    // Size size = MediaQuery.of(context).size;
    final ProducttotalAmount = ref.watch(CartProvider.notifier).ProductTotalAmount();
    final totalAmount = ref.watch(CartProvider.notifier).TotalAmount();
    final GstAmount = ref.watch(CartProvider.notifier).GstAmount();
    final cartNotifier = ref.read(CartProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: const Text('Cart'),
      ),
      body: Center(
        child: Column(
          children: [
            cart.isEmpty
                ? const Text('Cart is empty!')
                : Column(
                    children: [
                      SizedBox(
                        height: 450,
                        child: ListView.builder(
                          itemCount: cart.length,
                          itemBuilder: (context, index) {
                            final product = cart[index];
                            return Card(
                              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                              elevation: 1,
                              child: ListTile(
                                leading: Image.asset(
                                  'assets/images/${product.category}/${product.image}',
                                  width: 50,
                                  height: 50,
                                ),
                                title: Text(product.name, maxLines: 2, overflow: TextOverflow.ellipsis,),
                                subtitle: Text('\$${product.price}'),
                                trailing: Container(
                                  margin: const EdgeInsets.only(top: 30),
                                  height: 20,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFA4A0C),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 25,
                                        child: IconButton(
                                          padding: EdgeInsets.zero,
                                          icon: const Icon(Icons.remove, color: Colors.white, size: 10),
                                          onPressed: () {
                                            cartNotifier.removeCartItems(product);
                                          },
                                        ),
                                      ),
                                      Text(
                                        product.quantity.toString(),
                                        style: const TextStyle(fontSize: 12, color: Colors.white),
                                      ),
                                      SizedBox(
                                        width: 25,
                                        child: IconButton(
                                          padding: EdgeInsets.zero,
                                          
                                          icon: const Icon(Icons.add, color: Colors.white, size: 10),
                                          onPressed: () {
                                            cartNotifier.addCartItems(product);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text('Subtotal: \$${ProducttotalAmount.toStringAsFixed(2)}'),
                            Text('GST: \$${GstAmount.toStringAsFixed(2)}'),
                            const Text('Delivery Fee: \$0.99'),
                            const Divider(),
                            Text(
                              'Total: \$${(totalAmount + 0.99).toStringAsFixed(2)}',
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40, bottom: 19),
              child: custom_button(
                button_text: 'Checkout',
                function: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Delivery()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
