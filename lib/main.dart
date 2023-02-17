import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import './details.dart';

void main() => runApp(MaterialApp(
      home: Home(),
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int activeIndex = 0;
  int _selectedIndex = 0;
  int currentPageIndex = 0;

  final texts = [
    'STUFF 1',
    'STUFF 2',
    'STUFF 3',
    'STUFF 4',
  ];

  final images = [
    'assets/pic1.jpg',
    'assets/pic2.jpg',
    'assets/pic3.jpg',
    'assets/pic4.jpg',
  ];

  static TextStyle temporaryTextStyle =
      TextStyle(backgroundColor: Colors.yellow, fontSize: 20);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      currentPageIndex = index;
    });
  }

  Widget returnItinerary() {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child:
        Text("custom widget for ITINERARY\nINDEX 0", style: temporaryTextStyle),
      ),
    );
  }

  Widget returnSponsors() {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Text("custom widget for SPONSORS\nINDEX 1",
            style: temporaryTextStyle),
      ),
    );
  }

  Widget returnHome() {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 200),
        child: Column(
          children: <Widget>[
            CarouselSlider.builder(
              options: CarouselOptions(
                // enlargeStrategy: CenterPageEnlargeStrategy.height,
                // enlargeFactor: 0.65,
                height: 300,
                autoPlayInterval: Duration(seconds: 5),
                autoPlay: true,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) =>
                    setState(() => activeIndex = index),
              ),
              itemCount: images.length,
              itemBuilder: (BuildContext, index, realIndex) {
                // final image = images[index];
                // return buildImage(image, index);
                final text = texts[index];
                return buildTextBox(text, index);
              },
            ),
            SizedBox(height: 20),
            buildIndicator(),
          ],
        ),
      ),
    );
  }

  Widget returnCC() {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Text("custom widget for CORE COMMITTEE\nINDEX 3",
            style: temporaryTextStyle),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/bg.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.grey[400],
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.account_tree_outlined),
              label: "Itinerary",
              backgroundColor: Colors.grey[800],
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.handshake_outlined),
              label: "Sponsors",
              backgroundColor: Colors.grey[800],
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Home",
              backgroundColor: Colors.grey[800],
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people_outlined),
              label: "Core Committee",
              backgroundColor: Colors.grey[800],
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
        body: <Widget>[
          returnItinerary(),
          returnSponsors(),
          returnHome(),
          returnCC(),
        ][currentPageIndex],
      ),
    );
  }

  Widget buildImage(String image, int index) {
    return SizedBox(
      width: 400,
      //height: 0,
      //margin: EdgeInsets.symmetric(horizontal: 10),
      //color: Colors.grey,
      child: Image.asset(
        image,
        //fit: BoxFit.cover,
      ),
    );
  }

  Widget buildTextBox(String text, int index) {
    return GestureDetector(
        child: Container(
      color: Colors.white,
      //height: 0,
      width: 300,
      child: Text(text),
    ));
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: images.length,
        effect: WormEffect(
          dotHeight: 10,
          dotWidth: 10,
        ),
      );
}
