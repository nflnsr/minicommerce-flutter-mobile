import 'package:flutter/material.dart';

Widget testimonyCard(String name, String quote) {
  return SizedBox(
    width: 180,
    child: Column(
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                'assets/images/Loop Lighting_ What Every Photographer Should Know.jpeg',
                width: 38,
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.bold),
                ),
                Text(
                  quote,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.normal),
                ),
                const Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 243, 133, 23),
                      size: 14,
                    ),
                    Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 243, 133, 23),
                      size: 14,
                    ),
                    Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 243, 133, 23),
                      size: 14,
                    ),
                    Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 243, 133, 23),
                      size: 14,
                    ),
                    Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 243, 133, 23),
                      size: 14,
                    ),
                  ],
                )
              ],
            )
          ],
        )
      ],
    ),
  );
}
