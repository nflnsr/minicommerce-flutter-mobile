import 'package:flutter/material.dart';
import 'package:minicommerce/module/product_list/widget/testimony_card.dart';

Widget testimony() {
  return SizedBox(
    height: 80,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: [
        testimonyCard('John Doe', 'Great experience!'),
        testimonyCard('Jane Smith', 'Excellent quality!'),
        testimonyCard('Alex Johnson', 'Recommended'),
        testimonyCard('Mitie Dhin', 'Happy'),
      ],
    ),
  );
}
