import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class introscreens extends StatefulWidget {
  const introscreens({Key? key}) : super(key: key);

  @override
  State<introscreens> createState() => _introscreensState();
}

class _introscreensState extends State<introscreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            decoration: PageDecoration(bodyAlignment: Alignment.center),
            body: "Screen 1",
            title: "Welocome To My Wether App",
            image: Image.asset(
              'assets/images/4.png',
            ),
          ),
          PageViewModel(
            decoration: PageDecoration(bodyAlignment: Alignment.center),
            body: "Screen 2",
            title: "Enjoy To My Wether App",
          ),
        ],
        done: Text("Thank You"),
        showNextButton: false,
        onDone: () {
          Navigator.of(context).pushNamed("/");
        },
      ),
    );
  }
}
