import 'package:flutter/material.dart';
import 'package:minicommerce/core.dart';
import 'package:minicommerce/module/edit_product/view/edit_product_view.dart';
import 'package:minicommerce/module/product_detail/widget/product_detail.dart';

class ProductDetailView extends StatefulWidget {
  final String newid;
  const ProductDetailView({Key? key, required this.newid}) : super(key: key);

  @override
  State<ProductDetailView> createState() =>
      ProductDetailController(productid: newid);

  Widget build(context, ProductDetailController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Detail"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.edit),
            tooltip: 'Edit Product',
            onPressed: () {
              Get.to(EditProductView(id: newid));
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            tooltip: 'Delete Product',
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
                        child: const Text(
                          "No",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red[400],
                        ),
                        onPressed: () {
                          confirm = true;
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Yes",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  );
                },
              );
              if (confirm) {
                controller.deleteProduct(newid);
              }
              // ignore: void_checks
              return Future.value(false);
            },
          ),
        ],
      ),
      body: Container(
          child: controller.isLoading
              ? Container(
                  padding: const EdgeInsets.all(80),
                  child: const Center(
                    child: SizedBox(
                      width: 80, // Lebar CircularProgressIndicator
                      height: 80, // Tinggi CircularProgressIndicator
                      child: CircularProgressIndicator(
                        strokeWidth: 5, // Lebar garis CircularProgressIndicator
                      ),
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    var item = controller.product;
                    return productDetail(
                        context: context,
                        id: item['id'].toString(),
                        imgproduct: item['img_product'] ?? '',
                        productname:
                            item['product_name'] ?? 'Unknown Product Name',
                        typeproduct: item['type_product'],
                        price: item['price'] ?? 'Rp.0',
                        stock: item['stock'] ?? 0,
                        location: item['location'] ?? 'Unknown Location',
                        sold: item['sold'] ?? 0,
                        description: item['desc'] ?? 'Unknown Description');
                  },
                )),
    );
  }

 }
