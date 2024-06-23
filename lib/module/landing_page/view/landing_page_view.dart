import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

import 'package:minicommerce/core.dart';

final dio = Dio();

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  String productName = "";

  @override
  void initState() {
    super.initState();
    getHttp();
  }

  void getHttp() async {
    try {
      final response =
          await Dio().get('https://minicommerce.fly.dev/api/products');
      // List<dynamic> products = jsonDecode(response.data);
      setState(() {
        productName = response.data[2]['product_name'];
      });
      // print(response);
      // print(productName);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 145, 10, 10),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.person_rounded,
              size: 35,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            Icon(
              Icons.shopping_cart,
              size: 30,
              color: Color.fromARGB(255, 255, 255, 255),
            )
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  bannerSlider(context),
                  const SizedBox(height: 30),
                  categoryBox(), // Bagian untuk kotak voucher
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5,
                          spreadRadius: 1,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Best Products',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Color.fromARGB(255, 6, 6, 6),
                              ),
                            ),
                            TextButton(
                              onPressed: null,
                              child: Text(
                                'See more..',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 145, 10, 10),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Divider(
                          height: 1,
                          color: Colors.grey,
                          thickness: 1,
                        ),
                        const SizedBox(height: 8),
                        carouselSlider(),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5,
                          spreadRadius: 1,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Our Happy Client',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        const SizedBox(height: 16),
                        happyClient(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 145, 10, 10),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: const Center(
              child: Text(
                '© 2024 Minicommerce',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget categoryBox() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5,
            spreadRadius: 1,
            offset: Offset(0, 3),
          ),
        ],
      ),
      height: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Category",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                catagory('Fashion', 'assets/images/pakaian.png'),
                const SizedBox(width: 8),
                catagory('Sport', 'assets/images/olahraga.png'),
                const SizedBox(width: 8),
                catagory('Electronic', 'assets/images/elektronik.png'),
                const SizedBox(width: 8),
                catagory('Beauty', 'assets/images/beauty.png'),
                const SizedBox(width: 8),
                catagory('Stationery', 'assets/images/alat_tulis.png'),
                const SizedBox(width: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget catagory(String title, String imagePath) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      width: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            width: 50,
            height: 50,
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget carouselSlider() {
    String product_name = "";

    @override
    void initState() {
      getHttp();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: productCard(
                imagePath: 'assets/images/foto_produk3.jpeg',
                name: 'Lightning Lamp',
                price: 'Rp.100.000',
                location: 'Jakarta',
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: productCard(
                imagePath:
                    'assets/images/8f32a1f1-0467-419e-82d7-7bafce45d2e0.jpeg',
                name: 'Classic Lamp',
                price: 'Rp.120.000',
                location: 'Bekasi',
              ),
            ),
            const SizedBox(width: 8),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: productCard(
                imagePath: 'assets/images/foto_produk2.jpg',
                name: 'Classic Lamp',
                price: 'Rp.120.000',
                location: 'Tangerang',
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: productCard(
                imagePath:
                    'assets/images/c6e4bdfb-a1a1-4f19-a0eb-9df73b05e2f0.jpeg',
                name: 'Lightning Lamp',
                price: 'Rp.100.000',
                location: 'Jakarta Selatan',
              ),
            ),
            const SizedBox(width: 8),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: productCard(
                imagePath: 'assets/images/foto_produk3.jpeg',
                name: 'Lightning Lamp',
                price: 'Rp.100.000',
                location: 'Jakarta',
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: productCard(
                imagePath:
                    'assets/images/8f32a1f1-0467-419e-82d7-7bafce45d2e0.jpeg',
                name: 'Classic Lamp',
                price: 'Rp.120.000',
                location: 'Bekasi',
              ),
            ),
            const SizedBox(width: 8),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: productCard(
                imagePath: 'assets/images/foto_produk2.jpg',
                name: 'Classic Lamp',
                price: 'Rp.120.000',
                location: 'Tangerang',
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: productCard(
                imagePath:
                    'assets/images/c6e4bdfb-a1a1-4f19-a0eb-9df73b05e2f0.jpeg',
                name: 'Lightning Lamp',
                price: 'Rp.100.000',
                location: 'Jakarta Selatan',
              ),
            ),
            const SizedBox(width: 8),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: productCard(
                imagePath: 'assets/images/foto_produk3.jpeg',
                name:
                    'Lightning Lamp Lightning Lamp Lightning Lamp Lightning Lamp',
                price: 'Rp.100.000',
                location: 'Jakarta',
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: productCard(
                imagePath:
                    'assets/images/8f32a1f1-0467-419e-82d7-7bafce45d2e0.jpeg',
                name: 'Classic Lamp',
                price: 'Rp.120.000',
                location: 'Bekasi',
              ),
            ),
            const SizedBox(width: 8),
          ],
        ),
      ],
    );
  }

  Widget productCard({
    required String imagePath,
    required String name,
    required String price,
    required String location,
    int stock = 0,
  }) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5,
            spreadRadius: 1,
            offset: Offset(0, 3),
          ),
        ],
        border: Border.all(
          color: Colors.grey.withOpacity(0.5),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            name,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 3),
          Row(
            children: [
              Row(
                children: List.generate(
                  5,
                  (index) => const Icon(
                    Icons.star,
                    color: Color.fromARGB(255, 243, 133, 23),
                    size: 14,
                  ),
                ),
              ),
              const SizedBox(width: 4),
              const Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Terjual 100',
                    style: TextStyle(fontSize: 10),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                price,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 145, 10, 10),
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.inventory,
                    size: 12,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 2),
                  Text(
                    'Stock: $stock',
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    size: 12,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 2),
                  Text(
                    location,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.to(const ProductListView());
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  backgroundColor: const Color.fromARGB(255, 145, 10, 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Text(
                  'Buy Now',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  print('Add to Cart clicked for $name');
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  backgroundColor: const Color.fromARGB(255, 145, 10, 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget happyClient() {
    return SizedBox(
      height: 80,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          testimoniCard('John Doe', 'Great experience!'),
          testimoniCard('Jane Smith', 'Excellent quality!'),
          testimoniCard('Alex Johnson', 'Recommended'),
          testimoniCard('Mitie Dhin', 'Happy'),
        ],
      ),
    );
  }

  Widget testimoniCard(String name, String quote) {
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

  Widget bannerSlider(BuildContext context) {
    return CarouselSlider(
      items: [
        'assets/images/banner1.jpg',
        'assets/images/banner2.jpg',
        'assets/images/banner3.jpg',
      ].map((imagePath) {
        return Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            image: DecorationImage(
              image: AssetImage(imagePath),
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
}

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: LandingPage(),
      ),
    ),
  );
}
