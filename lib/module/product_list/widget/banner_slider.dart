import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

Widget bannerSlider(BuildContext context) {
  return CarouselSlider(
    items: [
      'assets/images/banner1.jpg',
      'assets/images/banner2.jpg',
      'assets/images/banner3.jpg',
    ].map((imgProduct) {
      return Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          image: DecorationImage(
            image: AssetImage(imgProduct),
            fit: BoxFit.fill,
          ),
        ),
      );
    }).toList(),
    options: CarouselOptions(
      height: 140,
      autoPlay: true,
      enlargeCenterPage: true,
    ),
  );
}
