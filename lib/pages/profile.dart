import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:zenaura/models/affirmation.dart';
import 'package:zenaura/widgets/savedAffirmationCard.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _deviceId = 'testdata';
  List<AffirmationModle> affirmations = [];

  @override
  void initState() {
    super.initState();
    setUserAffirmations();
  }

  Future<void> setUserAffirmations() async {
    var url = 'http://10.0.2.2:3000/savedAffirmations';
    var fullUrl = '$url?deviceId=$_deviceId';
    final response = await http.get(
      Uri.parse(fullUrl),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      List<AffirmationModle> fetchedAffirmations = jsonResponse.map((data) {
        return AffirmationModle.fromJson(data);
      }).toList();

      setState(() {
        affirmations = fetchedAffirmations;
      });
    } else {
      // Handle the error
      print('Failed to load affirmations');
    }

    print(response.body);
  }

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
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Saved Affirmations 📌',
              style: TextStyle(
                  fontSize: 28,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: affirmations.length,
                itemBuilder: (context, index) {
                  return SavedAffirmationCard(
                    title: affirmations[index].text,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
