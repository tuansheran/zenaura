import 'package:flutter/material.dart';

class SavedAffirmationCard extends StatefulWidget {
  final String title;

  const SavedAffirmationCard({super.key, required this.title});

  @override
  _SavedAffirmationCardState createState() => _SavedAffirmationCardState();
}

class _SavedAffirmationCardState extends State<SavedAffirmationCard> {
  bool isLiked = false;

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(
                    isLiked ? Icons.favorite : Icons.favorite_outline,
                    size: 30,
                    color: isLiked ? Colors.black : Colors.black,
                  ),
                  onPressed: toggleLike,
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
