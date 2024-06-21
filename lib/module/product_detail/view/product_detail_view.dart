import 'package:flutter/material.dart';
import 'package:minicommerce/core.dart';
import '../controller/product_detail_controller.dart';

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({Key? key}) : super(key: key);

  Widget build(context, ProductDetailController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("ProductDetail"),
        actions: const [],
      ),
      body: ListView.builder(
        itemCount: 3,
        physics: const ScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey[200],
                backgroundImage: const NetworkImage(
                  "https://res.cloudinary.com/dotz74j1p/raw/upload/v1716045088/aqwqm57kunudfs2y5swr.png",
                ),
              ),
              title: const Text("Jessica Doe"),
              subtitle: const Text("Programmer"),
            ),
          );
        },
      ),
    );
  }

  @override
  State<ProductDetailView> createState() => ProductDetailController();
}
