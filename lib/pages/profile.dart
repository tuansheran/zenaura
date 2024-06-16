import 'package:flutter/material.dart';
import 'package:zenaura/widgets/savedAffirmationCard.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final List<String> affirmationTitles = [
    'I am strong and capable.',
    'I am worthy of love and respect.',
    'I am in control of my life.',
    'I am grateful for everything I have.',
    'I am growing and learning every max outline.'
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
                itemCount: affirmationTitles.length,
                itemBuilder: (context, index) {
                  return SavedAffirmationCard(
                    title: affirmationTitles[index],
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
