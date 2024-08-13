import 'dart:convert';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:zenaura/widgets/affirmation.dart';
import 'package:http/http.dart' as http;

class IAMPage extends StatefulWidget {
  @override
  _IAMPageState createState() => _IAMPageState();
}

class _IAMPageState extends State<IAMPage> {
  List<String> _affirmations = [];
  bool _isFavorite = false;
  String _deviceId = '';

  @override
  void initState() {
    super.initState();
    getAffirmations();
  }

  Future<void> getDeviceId() async {
    var deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      print(androidInfo.id);
      setState(() {
        _deviceId = androidInfo.id;
      });
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      setState(() {
        _deviceId = iosInfo.identifierForVendor ?? 'unknown';
      });
    }
  }

  Future<void> setFavourite() async {
    var url = '';
  }

  Future<void> getAffirmations() async {
    var url = 'http://10.0.2.2:3000/feed';
    final response = await http.get(Uri.parse(url));
    final listOfAffirmations = jsonDecode(response.body);
    List<String> _dummyArray = [];

    for (var i = 0; i < listOfAffirmations.length; i++) {
      print(listOfAffirmations[i]['text']);
      _dummyArray.add(listOfAffirmations[i]['text']);
    }

    setState(() {
      _affirmations = _dummyArray;
    });
  }

  void toggleFavorite(int index) {
    setState(() {
      _isFavorite = true;
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
                              _isFavorite
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
