import 'package:flutter/material.dart';

class VideoInformationCard extends StatelessWidget {
  final String description;
  final String coverImagePath;

  const VideoInformationCard(
      {required this.description, required this.coverImagePath});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 120,
            child: Image.asset(
              coverImagePath,
              fit: BoxFit.fitWidth,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                description,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
