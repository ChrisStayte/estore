import 'package:estore/widgets/products_carousel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:palette_generator/palette_generator.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTab = 0;

  ImageProvider image = AssetImage('assets/images/exclusivewatch.png');

  PaletteGenerator palletGenerator;

  Future<void> _getDominantImageColor() async {
    palletGenerator = await PaletteGenerator.fromImageProvider(image);
    setState(() {});
  }

  @override
  void initState() {
    _getDominantImageColor();
    super.initState();
  }

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
            SizedBox(height: 25.0),
            ProductsCarousel(),
            SizedBox(height: 15.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                height: 360.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        palletGenerator == null
                            ? Colors.black
                            : palletGenerator.dominantColor.color
                                .withOpacity(0.6),
                        Colors.white.withOpacity((0.2))
                      ]),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0.0, 2.0),
                        blurRadius: 1.0),
                  ],
                ),
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: Image(
                        image: image,
                      ),
                    ),
                    Positioned(
                      bottom: 32,
                      left: 25,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Exclusive Watch",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0),
                          ),
                          Text(
                            "Explore",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 16.0),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
