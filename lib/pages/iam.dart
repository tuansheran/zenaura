import 'package:flutter/material.dart';
import 'package:zenaura/widgets/affirmation.dart';
import 'package:http/http.dart' as http;

class IAMPage extends StatefulWidget {
  @override
  _IAMPageState createState() => _IAMPageState();
}

class _IAMPageState extends State<IAMPage> {
  final List<String> _affirmations = [
    'testrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr',
    'testtworrrrrrrrrrrrrrrrrrrrr',
    'testthreerrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr',
    'testfoutrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr'
  ];

  // Track favorite status for each affirmation
  List<bool> _isFavorite = [false, false, false, false];

  @override
  void initState() {
    super.initState();
    getAffirmations();
  }

  Future<void> getAffirmations() async {
    var url = 'http://10.0.2.2:3000/data';
    final response = await http.get(Uri.parse(url));
    final responseString = response.body.toString();
    setState(() {
      _affirmations.add(responseString);
      _isFavorite.add(false); // Initialize favorite status for new affirmation
    });
  }

  void toggleFavorite(int index) {
    setState(() {
      _isFavorite[index] = !_isFavorite[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/whiteBackground.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: _affirmations.length,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Affirmation(
                    affirmation: _affirmations[index],
                  ),
                ),
                Positioned(
                  right: 20.0,
                  bottom: MediaQuery.of(context).size.height / 2 - 200,
                  child: GestureDetector(
                    onTap: () {
                      toggleFavorite(index);
                    },
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        // color: Colors.white.withOpacity(0.7),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Icon(
                              _isFavorite[index]
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Colors.black,
                              size: 30.0,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Icon(
                              Icons.share_outlined,
                              size: 30,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
