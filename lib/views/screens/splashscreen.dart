import 'dart:async';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
     Navigator.pushReplacementNamed(context, 'introscreen');
    });

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Image.asset(
                'assets/images/3.png',
                height: 100,
                width: 100,
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                child: Text(
                  "    Welcome To \nMy Weather App",
                  style: TextStyle(color: Colors.black,fontSize: 30),
                ),
              ),
              SizedBox(
                height:50,
              ),
              CircularProgressIndicator(color: Colors.black,),
            ],
          ),
        ),
        backgroundColor: Colors.blue.shade300,
      ),
    );
  }
}
