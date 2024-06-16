import 'package:flutter/material.dart';

class Affirmation extends StatelessWidget {
  final String affirmation;
  const Affirmation({super.key, required this.affirmation});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height,
        // color: Colors.amberAccent,
        child: Center(
            child: Text(
          textAlign: TextAlign.center,
          affirmation,
          style: const TextStyle(
              fontSize: 28, fontFamily: 'Poppins', fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
