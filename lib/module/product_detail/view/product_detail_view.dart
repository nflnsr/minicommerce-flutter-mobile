import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:minicommerce/core.dart';
import 'package:minicommerce/module/edit_product/view/edit_product_view.dart';
import '../controller/product_detail_controller.dart';

class ProductDetailView extends StatefulWidget {
  final String newid;
  const ProductDetailView({Key? key, required this.newid}) : super(key: key);
  
  @override
  State<ProductDetailView> createState()=>ProductDetailController(productid: newid);

  Widget build(context, ProductDetailController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Detail"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.edit),
            tooltip: 'Edit Product',
            onPressed: (){
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
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: const <Widget>[
                                  Text(
                                      'Are you sure you want to delete this item?'),
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
                                child: const Text("No"),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blueGrey,
                                ),
                                onPressed: () {
                                  confirm = true;
                                  Navigator.pop(context);
                                },
                                child: const Text("Yes"),
                              ),
                            ],
                          );
                        },
                      );
                      if (confirm) {
                        controller.deleteProduct(newid);
                      }
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
              width:
              80, // Lebar CircularProgressIndicator
              height:
              80, // Tinggi CircularProgressIndicator
              child: CircularProgressIndicator(
                strokeWidth:
                5, // Lebar garis CircularProgressIndicator
                ),
              ),
            ),
          )
        : ListView.builder(
          itemCount: 1,
            itemBuilder:
            (BuildContext context, int index){
              var item = controller.product;
              return productdetail(
                context: context,
                id: item['id'].toString(),
                imgproduct: item['img_product']??'',
                productname: item['product_name']??'Unknown Product Name',
                typeproduct: item['type_product'],
                price: item['price']??'Rp.0',
                stock: item['stock']??0,
                location: item['location']??'Unknown Location',
                sold: item['sold']??0,
                description: item['desc']??'Unknown Description'
              );
            },
          )
      ),
      
    );
  }

  

  Widget productdetail({
    required BuildContext context,
    required String id,
    required String productname,
    required String imgproduct,
    required String typeproduct,
    required String price,
    required int sold,
    required String location,
    required int stock,
    required String description
  }){
    return Container(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.memory(
              base64Decode(imgproduct),
              fit: BoxFit.cover,
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
                  )
                ),
                
              ],
            ),const SizedBox(height: 6),
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
}


// body: ListView.builder(
      //   itemCount: 3,
      //   physics: const ScrollPhysics(),
      //   itemBuilder: (BuildContext context, int index) {
      //     return Card(
      //       child: ListTile(
      //         leading: CircleAvatar(
      //           backgroundColor: Colors.grey[200],
      //           backgroundImage: const NetworkImage(
      //             "https://res.cloudinary.com/dotz74j1p/raw/upload/v1716045088/aqwqm57kunudfs2y5swr.png",
      //           ),
      //         ),
      //         title: const Text("Jessica Doe"),
      //         subtitle: const Text("Programmer"),
      //       ),
      //     );
      //   },
      // ),