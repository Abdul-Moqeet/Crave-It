import 'package:flutter/material.dart';
class custom_button extends StatelessWidget {
  const custom_button({
    super.key,
    required this.button_text,
    required this.function
  });
final String button_text;
final Function() function;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
        TextButton(
          onPressed: function,
          child: Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFFFA4A0C)),
                child:  Center(child: Text(button_text, style: const TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'SFProRounded-Regular.ttf'),)),
          ),
        ),
        const SizedBox(height: 30,)
      ],
    );
  }
}
