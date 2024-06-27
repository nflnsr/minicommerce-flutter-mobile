import 'package:flutter/material.dart';
import 'package:minicommerce/core.dart';
import 'package:minicommerce/module/product_list/widget/banner_slider.dart';
import 'package:minicommerce/module/product_list/widget/category_box.dart';
import 'package:minicommerce/module/product_list/widget/product_card.dart';
import 'package:minicommerce/module/product_list/widget/testimony.dart';

class ProductListView extends StatefulWidget {
  const ProductListView({super.key});

  Widget build(context, ProductListController controller) {
    controller.view = this;
    return Scaffold(
      body: _ProductListView(),
    );
  }

  @override
  State<ProductListView> createState() => ProductListController();
}

class _ProductListView extends StatelessWidget {
  final controller = ProductListController.instance;
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.person_rounded,
              size: 35,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            GestureDetector(
              onTap: () async {
                await Get.to(const AddProductView());
                controller.getProducts();
              },
              child: const Icon(
                Icons.add,
                size: 30,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
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
                  categoryBox(),
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
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Products',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Color(0xFF060606),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'See more..',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12,
                                    color: Color(0xFF910A0A),
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
                          controller.isLoading
                              ? Container(
                                  padding: const EdgeInsets.all(80),
                                  child: const Center(
                                    child: SizedBox(
                                      width: 80,
                                      height: 80,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 5,
                                      ),
                                    ),
                                  ),
                                )
                              : GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: controller.products.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 8.0,
                                    mainAxisSpacing: 8.0,
                                    childAspectRatio: 0.48,
                                  ),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    var item = controller.products[index];
                                    return productCard(
                                      context: context,
                                      controller: controller,
                                      id: item['id'].toString(),
                                      imgProduct: item['img_product'] ?? '',
                                      name: item['product_name'] ??
                                          'Unknown Product Name',
                                      price: item['price'] ?? 'Rp.0',
                                      location: item['location'] ??
                                          'Unknown Location',
                                      stock: item['stock'] ?? 0,
                                      sold: item['sold'] ?? 0,
                                    );
                                  },
                                ),
                        ],
                      )),
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
                        testimony(),
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

}
