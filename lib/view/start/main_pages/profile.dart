// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

import '../../../components/widgets/custom_button.dart';

class profile_page extends StatefulWidget {
  const profile_page({super.key});

  @override
  State<profile_page> createState() => _profile_pageState();
}

class _profile_pageState extends State<profile_page> {
  String? _selectedvalue = 'Option 1';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.zero,
        child: custom_appBar()),
      // backgroundColor: const Color(0xFFF2F2F2),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Information',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            Card(
              elevation: 1,
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                height: 130,
                width: 350,
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      child: Image.asset('assets/images/Rectangle 6.png'),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 20.0, left: 10),
                      child: SizedBox(
                        height: 120,
                        width: 185,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Marvis Ighedosa',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'SFProRounded-Regular.ttf',
                                  fontSize: 18),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'example@gmail.com',
                              style: TextStyle(
                                  fontFamily: 'SFProRounded-Regular.ttf',
                                  fontSize: 12),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '1234 Elm Street, Apt 56, Springfield, IL 62704, United States',
                              style: TextStyle(
                                  fontFamily: 'SFProRounded-Regular.ttf',
                                  fontSize: 11),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Payment Method',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 240,
                  width: double.infinity,
                  child: Card(
                    elevation: 5,
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
                                groupValue: _selectedvalue,
                                onChanged: (String? value) {
                                  setState(() {
                                    _selectedvalue = value;
                                  });
                                },
                              ),
                              Image.asset('assets/icons/card.png'),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                'Card',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal),
                              )
                            ],
                          ),
                          const Padding(
                            padding:
                                EdgeInsets.only(left: 50.0, right: 30),
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
                                groupValue: _selectedvalue,
                                onChanged: (String? value) {
                                  setState(() {
                                    _selectedvalue = value;
                                  });
                                },
                              ),
                              Image.asset('assets/icons/bank.png'),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                'Bank account',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal),
                              )
                            ],
                          ),
                          const Padding(
                            padding:
                                EdgeInsets.only(left: 50.0, right: 30),
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
                                groupValue: _selectedvalue,
                                onChanged: (String? value) {
                                  setState(() {
                                    _selectedvalue = value;
                                  });
                                },
                              ),
                              Image.asset('assets/icons/paypal.png'),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                'Paypal',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Expanded(child: Container()),
            custom_button(button_text: 'Update', function: () {
              
            },),
           
          ],
        ),
      ),
    );
  }
}

class custom_appBar extends StatelessWidget {
  const custom_appBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(icon: const Icon(Icons.arrow_back_ios), onPressed: () {
        Navigator.pop(context);
      },),
      forceMaterialTransparency: true,
    );
  }
}

