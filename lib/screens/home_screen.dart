import 'package:estore/widgets/products_carousel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "E Store",
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.w600),
                  ),
                  CircleAvatar(
                    radius: 25.0,
                    backgroundImage: NetworkImage(
                        'https://pbs.twimg.com/profile_images/1212568050467328002/HC8bl-WU_400x400.jpg'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            ProductsCarousel(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int value) {
          setState(() {
            _currentTab = value;
          });
        },
        elevation: 0.0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        currentIndex: _currentTab,
        items: [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.solidCompass,
                size: 26.0,
                color: _currentTab == 0
                    ? Theme.of(context).primaryColor
                    : Colors.grey),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.mapMarkerAlt,
                size: 26.0,
                color: _currentTab == 1
                    ? Theme.of(context).primaryColor
                    : Colors.grey),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.shoppingCart,
                size: 26.0,
                color: _currentTab == 2
                    ? Theme.of(context).primaryColor
                    : Colors.grey),
            title: SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
