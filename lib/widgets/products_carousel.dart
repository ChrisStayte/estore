import 'package:estore/models/product_model.dart';
import 'package:estore/screens/product_screen.dart';
import 'package:flutter/material.dart';

class ProductsCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            children: <Widget>[
              Text(
                "Collection",
                style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.w600,
                    //color: Colors.black,
                    letterSpacing: 0.5),
              ),
            ],
          ),
        ),
        Container(
          //color: Colors.blue,
          height: 210,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index) {
              Product product = products[index];
              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProductScreen(
                      product: product,
                    ),
                  ),
                ),
                child: Hero(
                  tag: product.backgroundColor,
                  child: Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 7.5),
                    width: 140.0,
                    decoration: BoxDecoration(
                      color: product.backgroundColor,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0.0, 2.0),
                            blurRadius: 1.0),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Image(
                          height: 100.0,
                          image: AssetImage(product.imageUrl),
                        ),
                        Text(
                          product.shortName,
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
