import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delievery/providers/theme_provider.dart';
import 'package:food_delievery/view/start/homepage_main.dart';
import 'package:food_delievery/view/start/main_pages/side_menu.dart';

class Navigation_page extends ConsumerStatefulWidget {
  const Navigation_page({super.key});

  @override
  ConsumerState<Navigation_page> createState() => _Navigation_pageState();
}

class _Navigation_pageState extends ConsumerState<Navigation_page> with SingleTickerProviderStateMixin {
  bool menu_selected = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleMenu() {
    setState(() {
      menu_selected = !menu_selected;
      if (menu_selected) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // Watch the current theme mode from Riverpod
    final themeMode = ref.watch(themeNotifierProvider);
    final isDarkMode = themeMode == ThemeMode.dark;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 251, 83, 21),
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              double slide = 210.0 * _animation.value;
              double scale = 1 - (_animation.value * 0.3);
              double rotation = _animation.value * (30 * pi / 180);

              return Stack(
                children: [
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 20),
                    left: _animation.value == 1 ? 0 : -210,
                    child: Container(
                      width: 210,
                      height: size.height,
                      child: const side_menu(),
                    ),
                  ),
                  Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(rotation),
                    child: Transform.translate(
                      offset: Offset(slide, 0),
                      child: Transform.scale(
                        scale: scale,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: const Homepage(),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          Positioned(
            top: 50,
            left: 40,
            child: GestureDetector(
              onTap: _toggleMenu,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Image.asset(
                  'assets/icons/menu.png',
                  color: isDarkMode ? Colors.white : Colors.black, // Change color based on theme mode
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
