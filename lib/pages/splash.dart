import 'dart:async';
import 'package:news_app/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:news_app/theme/theme.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(milliseconds: 2500),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => Splash2())));

    return Scaffold(
      backgroundColor: purple_primary,
      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
          width: 120,
          height: 90,
        ),
      ),
    );
  }
}

class Splash2 extends StatefulWidget {
  @override
  _Splash2State createState() => _Splash2State();
}

class _Splash2State extends State<Splash2> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.08),
          CarouselSlider(
            items: imageSliders,
            options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.40,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.map((url) {
              int index = imgList.indexOf(url);
              return Container(
                width: _current == index ? 30 : 8,
                height: 8.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: _current == index ? purple_primary : grey_lighter,
                ),
              );
            }).toList(),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.10),
          Text("First to know",
              style: semibold.copyWith(fontSize: 24, color: black_primary)),
          SizedBox(height: 24),
          Text(
            "All news in one place, be the \nfirst to know last news",
            style: regular.copyWith(
              fontSize: 16,
              color: grey_primary,
            ),
            textAlign: TextAlign.center,
          ),
          Spacer(),
          Center(
            child: new InkWell(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => Splash3()));
              },
              child: Ink(
                width: MediaQuery.of(context).size.width - 40,
                height: 60,
                decoration: BoxDecoration(
                    color: purple_primary,
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                    child: Text(
                  "Next",
                  style: semibold.copyWith(fontSize: 16, color: Colors.white),
                )),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
        ],
      ),
    );
  }
}

List<String> imgList = [
  "assets/images/splash1.png",
  "assets/images/splash2.png",
  "assets/images/splash3.png"
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        child: Image.asset(
                          item,
                          fit: BoxFit.cover,
                          width: 350,
                        )),
                  ],
                )),
          ),
        ))
    .toList();

class Splash3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.15),
          Center(
            child: Image.asset("assets/images/hand.png"),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.15),
          Text("Nuntium",
              style: bold.copyWith(fontSize: 30, color: black_primary)),
          SizedBox(height: 24),
          Text(
            "All news in one place, be the \nfirst to know last news",
            style: regular.copyWith(
              fontSize: 16,
              color: grey_primary,
            ),
            textAlign: TextAlign.center,
          ),
          Spacer(),
          Center(
            child: new InkWell(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => HomePage()));
              },
              child: Ink(
                width: MediaQuery.of(context).size.width - 40,
                height: 60,
                decoration: BoxDecoration(
                    color: purple_primary,
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                    child: Text(
                  "Next",
                  style: semibold.copyWith(fontSize: 16, color: Colors.white),
                )),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
        ],
      ),
    );
  }
}
