import 'package:estore/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductScreen extends StatefulWidget {
  final Product product;

  ProductScreen({this.product});

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int _currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: widget.product.backgroundColor,
        child: Container(
          margin: EdgeInsets.only(bottom: 20.0),
          decoration: BoxDecoration(
            color: widget.product.backgroundColor,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(45.0),
                bottomRight: Radius.circular(45.0)),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.arrow_back),
                          iconSize: 25.0,
                          onPressed: () => Navigator.pop(context),
                        ),
                        IconButton(
                          icon: Icon(Icons.favorite_border),
                          iconSize: 25.0,
                          onPressed: () => print("Hearted"),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Image(
                      height: 250,
                      image: AssetImage(widget.product.imageUrl),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12.0),
                                topRight: Radius.circular(38.0),
                                bottomLeft: Radius.circular(38.0),
                                bottomRight: Radius.circular(12.0)),
                          ),
                          child: Text(
                            '\$${widget.product.price}',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 05.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          widget.product.fullName,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 25.0),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Features",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.0,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 05.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0, right: 10.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: widget.product.features
                            .map((feature) => Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    feature,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ))
                            .toList()),
                  ),
                  Expanded(
                    child: Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 60.0, vertical: 12.0),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(38.0),
                            topRight: Radius.circular(38.0),
                          ),
                        ),
                        child: Text(
                          "Buy Now",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 18.0),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
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
