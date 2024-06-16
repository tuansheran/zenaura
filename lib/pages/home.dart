import 'package:flutter/material.dart';
import 'package:zenaura/widgets/bookInformationCard.dart';
import 'package:zenaura/widgets/videoInformationCard.dart'; // Assuming this is your custom card widget

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> _bookMetaData = [
    {
      'bookTitle': 'Collision With Infinity',
      'imagePath': 'assets/images/collisionWithInfinite.jpg'
    },
    {
      'bookTitle': 'Infinity And The Mind',
      'imagePath': 'assets/images/infinityAndTheMind.jpg'
    },
    {
      'bookTitle': 'DMT: The Spirit Molecule',
      'imagePath': 'assets/images/image.png'
    },
  ];

  final List<Map<String, String>> _videoMetaData = [
    {'videoTitle': 'Remember Past Lives', 'url': ''},
    {'videoTitle': 'Remember Past Lives', 'url': ''},
    {'videoTitle': 'Remember Past Lives', 'url': ''},
    {'videoTitle': 'Remember Past Lives', 'url': ''}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Zenaura',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                  color: Colors.white),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, top: 20, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Infomative Books 📚',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      fontSize: 25),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 200.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _bookMetaData.length,
                itemBuilder: (context, index) {
                  return Bookinformationcard(
                      title: _bookMetaData[index]['bookTitle']!,
                      logoImagePath: _bookMetaData[index]['imagePath']!);
                },
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              const Text(
                'Informative Videos',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    fontSize: 25),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                  height: 38,
                  width: 38,
                  child: Image.asset('assets/images/yt.png'))
            ]),
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: _videoMetaData.length,
                    itemBuilder: (context, index) {
                      return VideoInformationCard(
                          description: _videoMetaData[index]['videoTitle']!,
                          coverImagePath: _videoMetaData[index]['url']!);
                    }))
          ],
        ),
      ),
    );
  }
}
