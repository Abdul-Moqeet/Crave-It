import 'package:flutter/material.dart';
import 'package:food_delievery/components/widgets/custom_button.dart';
import 'package:food_delievery/view/start/Navigation.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: const Color.fromARGB(232, 255, 255, 255),
      body: Column(
        children: [
          SizedBox(
            height: 350,
            width: size.width,
            child: Card(
              color: Colors.white,
              elevation: 5,
              shadowColor: Colors.black12,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/Group.png',
                      height: 150,
                      width: size.width,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            children: [
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    isSelected = false;
                                  });
                                },
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              isSelected == false
                                  ? const SizedBox(
                                      height: 1,
                                      width: 110,
                                      child: Divider(
                                        color: Color(0xFFFA4A0C),
                                        thickness: 3,
                                      ),
                                    )
                                  : const SizedBox(
                                      height: 1,
                                    ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Column(
                            children: [
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    isSelected = true;
                                  });
                                },
                                child: const Text(
                                  'Sign-up',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              isSelected == true
                                  ? const SizedBox(
                                      height: 1,
                                      width: 110,
                                      child: Divider(
                                        color: Color(0xFFFA4A0C),
                                        thickness: 3,
                                      ),
                                    )
                                  : const SizedBox(
                                      height: 1,
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 100),
            switchInCurve: Curves.easeInOut,
            child: isSelected
                ? Padding(
                    key: const Key('login'),
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Column(
                      key: const Key('login_form'),
                      children: [
                        const Credentials(
                          hint: 'example@gmail.com',
                          label: 'Email address',
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Credentials(
                          hint: '********',
                          label: 'Password',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(0),
                          ),
                          onPressed: () {},
                          child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Forgot password?',
                              style: TextStyle(
                                color: Color(0xFFFA4A0C),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        custom_button(button_text: 'Signup', function: (){
                          
                        })
                      ],
                    ),
                  )
                : Padding(
                    key: const Key('signup'),
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Column(
                      key: const Key('signup_form'),
                      children: [
                        const Credentials(
                          hint: 'example@gmail.com',
                          label: 'Email address',
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Credentials(
                          hint: '********',
                          label: 'Password',
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Credentials(
                          hint: '********',
                          label: 'Confirm password',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(0),
                          ),
                          onPressed: () {},
                          child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Already have an account?',
                              style: TextStyle(
                                color: Color(0xFFFA4A0C),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        custom_button(button_text: 'Login', function: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const Navigation_page()));
                        })
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

class Credentials extends StatelessWidget {
  const Credentials({Key? key, required this.hint, required this.label})
      : super(key: key);

  final String hint;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: hint,
            labelText: label,
            labelStyle: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
