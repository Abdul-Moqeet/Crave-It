import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delievery/providers/cart_items_provider.dart';

final SelectedProvider = StateProvider<String?>(
  (ref) {
    return null;
  },
);

final delivery_selectedProvider = StateProvider<String?>(
  (ref) {
    return null;
  },
);

class Delivery extends ConsumerWidget {
  const Delivery({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(CartProvider);
    final TotalAmount = ref.read(CartProvider.notifier).TotalAmount();
  

    return Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.0),
        child: Payment_section(),
      ),
      const Padding(
        padding: EdgeInsets.only(left: 40.0, right: 40, top: 40),
        child: delivery_section(),
      ),
      Text(TotalAmount.toString())
    ]));
  }
}

class delivery_section extends ConsumerWidget {
  const delivery_section({
    super.key,
  
  });

  
  

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected_payment = ref.watch(delivery_selectedProvider);
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text('Delivery',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      const SizedBox(
        height: 10,
      ),
      SizedBox(
        height: 170,
        width: double.infinity,
        child: Card(
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                
                  children: [
                    Radio<String>(
                      toggleable: true,
                      fillColor: WidgetStateProperty.all(Colors.red),
                      activeColor: Colors.red,
                      value: 'Option 1',
                      groupValue: selected_payment,
                      onChanged: (String? value) {
                        ref.read(delivery_selectedProvider.notifier).state = value;
                      },
                    ),
                  
                    const Text(
                      'Delivery',
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.normal),
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 50.0, right: 30),
                  child: Divider(
                    color: Color.fromARGB(255, 195, 194, 194),
                  ),
                ),
                Row(
                  children: [
                    Radio<String>(
                      toggleable: true,
                      fillColor: WidgetStateProperty.all(Colors.red),
                      activeColor: Colors.red,
                      value: 'Option 2',
                      groupValue: selected_payment,
                      onChanged: (String? value) {
                        ref.read(delivery_selectedProvider.notifier).state = value;
                      },
                    ),
                   
                    const Text(
                      'Pickup',
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.normal),
                    )
                  ],
                ),
               
                
              ],
            ),
          ),
        ),
      )
    ],
        );
  }
}

class Payment_section extends ConsumerWidget {
  const Payment_section({
    super.key,

  });


  @override
  Widget build(BuildContext context, WidgetRef ref) {
      final selected_payment = ref.watch(SelectedProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Payment Method',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 230,
          width: double.infinity,
          child: Card(
            elevation: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Radio<String>(
                        toggleable: true,
                        fillColor: WidgetStateProperty.all(Colors.red),
                        activeColor: Colors.red,
                        value: 'Option 1',
                        groupValue: selected_payment,
                        onChanged: (String? value) {
                          ref.read(SelectedProvider.notifier).state = value;
                        },
                      ),
                      Image.asset('assets/icons/card.png'),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Card',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.normal),
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 50.0, right: 30),
                    child: Divider(
                      color: Color.fromARGB(255, 195, 194, 194),
                    ),
                  ),
                  Row(
                    children: [
                      Radio<String>(
                        toggleable: true,
                        fillColor: WidgetStateProperty.all(Colors.red),
                        activeColor: Colors.red,
                        value: 'Option 2',
                        groupValue: selected_payment,
                        onChanged: (String? value) {
                          ref.read(SelectedProvider.notifier).state = value;
                        },
                      ),
                      Image.asset('assets/icons/bank.png'),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Bank account',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.normal),
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 50.0, right: 30),
                    child: Divider(
                      color: Color.fromARGB(255, 195, 194, 194),
                    ),
                  ),
                  Row(
                    children: [
                      Radio<String>(
                        toggleable: true,
                        fillColor: WidgetStateProperty.all(Colors.red),
                        activeColor: Colors.red,
                        value: 'Option 3',
                        groupValue: selected_payment,
                        onChanged: (String? value) {
                          ref.read(SelectedProvider.notifier).state = value;
                        },
                      ),
                      Image.asset('assets/icons/paypal.png'),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Paypal',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.normal),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
