import 'package:flutter/material.dart';

class Product {
  String imageUrl;
  String shortName;
  String fullName;
  double price;
  List<String> features;
  Color backgroundColor;

  Product({
    this.imageUrl,
    this.shortName,
    this.fullName,
    this.price,
    this.features,
    this.backgroundColor,
  });
}

List<Product> products = [
  Product(
    imageUrl: 'assets/images/beats_solo3.png',
    shortName: 'Headset',
    fullName: 'Beats Solo 3',
    price: 179.99,
    features: [
      'Driven By Apple W1 Chip.',
      'Wireless The Way It Should Be.',
      'Up to 40 hours of battery life for multi-day use.',
      'Custom Comfort.'
    ],
    backgroundColor: Color(0xFF3DBFDC),
  ),
  Product(
    imageUrl: 'assets/images/bose_minispeaker.png',
    shortName: 'Mini Speaker',
    fullName: 'Bose Sound Link',
    price: 99.99,
    features: [
      'Engineered to deliver bold sound wherever life takes you.',
      'Innovative Bose technology packs big sound into a small, water-resistant speaker.',
      'Voice prompts talk you through Bluetooth pairing so it’s easier than ever.',
      'Lithium-ion battery lets you enjoy up to 8 hours of play time.'
    ],
    backgroundColor: Color(0xFFFFC411),
  ),
  Product(
    imageUrl: 'assets/images/applewatch.png',
    shortName: 'Smart Watch',
    fullName: 'Apple Watch Series 5',
    price: 599.99,
    features: [
      'Get a quick read on your heart rate, or check your heart rhythm with the ECG app.',
      'The new Noise app alerts you when decibels rise to levels that can impact your hearing.',
      'Listen to the entire Apple Music library, not to mention podcasts and audiobooks.',
      'The App Store is now on your wrist, so you can find and download the latest apps in seconds.'
    ],
    backgroundColor: Color(0xFFFE6E63),
  ),
];
