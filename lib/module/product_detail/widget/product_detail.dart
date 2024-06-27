import 'dart:convert';
import 'package:flutter/material.dart';

Widget productDetail(
    {required BuildContext context,
    required String id,
    required String productname,
    required String imgproduct,
    required String typeproduct,
    required String price,
    required int sold,
    required String location,
    required int stock,
    required String description}) {
  return Container(
    padding: const EdgeInsets.all(10),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.memory(
            base64Decode(imgproduct),
            fit: BoxFit.contain,
            width: double.infinity,
            height: 400,
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(6),
            child: Text(
              textAlign: TextAlign.left,
              productname,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    const Text(
                      'Product Type: ',
                      style: TextStyle(
                        color: Color.fromARGB(255, 172, 28, 2),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 2),
                    Text(
                      typeproduct,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 14,
                      color: Colors.blueGrey,
                    ),
                    const SizedBox(width: 2),
                    const Text(
                      'Location: ',
                      style: TextStyle(
                        color: Color.fromARGB(255, 172, 28, 2),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 2),
                    Text(
                      location,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    const Text(
                      'Price: ',
                      style: TextStyle(
                        color: Color.fromARGB(255, 172, 28, 2),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 2),
                    Text(
                      price,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      const Text(
                        'Sold: ',
                        style: TextStyle(
                          color: Color.fromARGB(255, 172, 28, 2),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 2),
                      Text(
                        '$sold',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    const Text(
                      'Stock: ',
                      style: TextStyle(
                        color: Color.fromARGB(255, 172, 28, 2),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '$stock',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Divider(
            height: 1,
            color: Colors.grey,
            thickness: 0.5,
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  textAlign: TextAlign.center,
                  'Description',
                  style: TextStyle(
                    color: Color.fromARGB(255, 172, 28, 2),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  textAlign: TextAlign.justify,
                  description,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
