import 'package:flutter/material.dart';
import 'package:minicommerce/module/product_list/widget/category.dart';

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
                category('Fashion', 'assets/images/pakaian.png'),
                const SizedBox(width: 8),
                category('Sport', 'assets/images/olahraga.png'),
                const SizedBox(width: 8),
                category('Electronic', 'assets/images/elektronik.png'),
                const SizedBox(width: 8),
                category('Beauty', 'assets/images/beauty.png'),
                const SizedBox(width: 8),
                category('Stationery', 'assets/images/alat_tulis.png'),
                const SizedBox(width: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }
