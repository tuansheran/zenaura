import 'package:flutter/material.dart';

class Bookinformationcard extends StatelessWidget {
  final String title;
  final String logoImagePath;

  const Bookinformationcard({
    super.key,
    required this.title,
    required this.logoImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 290,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 0,
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 120,
              child: Image.asset(logoImagePath, fit: BoxFit.fitWidth),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontFamily: 'Poppins')),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 30,
                    width: 135,
                    child: FilledButton(
                        style: ButtonStyle(
                            backgroundColor:
                                WidgetStateProperty.all<Color>(Colors.black)),
                        onPressed: () {},
                        child: const Text(
                          'View Details',
                          style: TextStyle(
                              // fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                              color: Colors.white),
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
