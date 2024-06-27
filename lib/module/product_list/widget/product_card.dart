import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:minicommerce/core.dart';
import 'package:minicommerce/module/edit_product/view/edit_product_view.dart';

Widget productCard({
  required BuildContext context,
  required String id,
  required String imgProduct,
  required String name,
  required String price,
  required String location,
  required int sold,
  required int stock,
  required ProductListController controller,
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
    child: GestureDetector(
      onTap: () {
        Get.to(ProductDetailView(newid: id));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.memory(
              base64Decode(imgProduct),
              fit: BoxFit.contain,
              width: double.infinity,
              height: 200,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            name.length > 42 ? '${name.substring(0, 42)}...' : name,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
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
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Icon(
                        Icons.inventory,
                        size: 12,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        'Stock $stock',
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
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
                price.length > 14 ? '${price.substring(0, 14)}...' : price,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 145, 10, 10),
                ),
              ),
              Text(
                'Sold $sold',
                style: const TextStyle(fontSize: 10),
              ),
            ],
          ),
          const SizedBox(height: 4),
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
                  Get.to(EditProductView(
                    id: id,
                  ));
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  backgroundColor: const Color.fromARGB(255, 145, 10, 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Edit',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(width: 15),
                    Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 20,
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    bool confirm = false;
                    await showDialog<void>(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Confirm'),
                          content: const SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                Text(
                                  'Are you sure you want to delete this item?',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey[600],
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("No",
                                  style: TextStyle(
                                    color: Colors.white,
                                  )),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red[400],
                              ),
                              onPressed: () {
                                confirm = true;
                                Navigator.pop(context);
                              },
                              child: const Text("Yes",
                                  style: TextStyle(
                                    color: Colors.white,
                                  )),
                            ),
                          ],
                        );
                      },
                    );
                    if (confirm) {
                      controller.deleteProduct(id);
                    }
                    // ignore: void_checks
                    return Future.value(false);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    backgroundColor: const Color.fromARGB(255, 145, 10, 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Delete',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(width: 6.5),
                      Icon(
                        Icons.delete,
                        color: Colors.white,
                        size: 20,
                      ),
                    ],
                  )),
            ],
          ),
        ],
      ),
    ),
  );
}
