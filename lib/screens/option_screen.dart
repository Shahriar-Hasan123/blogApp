import 'package:blog_app/components/roundButton.dart';
import 'package:blog_app/screens/loginScreen.dart';
import 'package:blog_app/screens/signin.dart';
import 'package:flutter/material.dart';

class OptionScreen extends StatefulWidget {
  const OptionScreen({super.key});

  @override
  State<OptionScreen> createState() => _OptionScreenState();
}

class _OptionScreenState extends State<OptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(image: AssetImage('images/memories.png')),
              SizedBox(
                height: 40,
              ),
              roundButton(
                tittle: 'Login',
                onPress: () {
                     Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ),
              SizedBox(
                height: 38,
              ),
              roundButton(
                tittle: 'Register',
                onPress: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Signin()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
