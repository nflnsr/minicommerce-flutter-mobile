import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:minicommerce/core.dart';
import 'package:minicommerce/shared/utils/validator.dart';
import 'package:minicommerce/shared/widget/form/dropdown.dart';
import 'package:minicommerce/shared/widget/form/memofield.dart';
import 'package:minicommerce/shared/widget/form/number_field.dart';
import 'package:minicommerce/shared/widget/form/text_field.dart';
import '../controller/edit_product_controller.dart';

class EditProductView extends StatefulWidget {
  final String id;
  const EditProductView({super.key, required this.id});
  
  @override
  State<EditProductView> createState() => EditProductController(id: id);

  Widget build(context, EditProductController controller) {
    var item=controller.product;
    controller.view = this;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Product"),
        actions: const [],
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
        : SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        MaterialButton(
                          color: Colors.blue,
                          onPressed: () {
                            controller.pickImage();
                          },
                          child: const Text(
                            "Upload Image",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 10),
                        //controller.imgProduct = item['img_product'],
                        controller.imgProduct == null
                            ? const Text("No Image Selected")
                            : Image.file(controller.imgProduct!),
                      ],
                    ),
                  ),
                  // QImagePicker(
                  //   label: "Photo",
                  //   // validator: Validator.required,
                  //   value: null,
                  //   onChanged: (value) {},
                  // ),
                  QTextField(
                    label: "Product Name",
                    validator: Validator.required,
                    value: item['product_name'],
                    onChanged: (value) {
                      controller.productName = value;
                    },
                  ),
                  QNumberField(
                    label: "Price",
                    validator: Validator.required,
                    value: item['price'].toString(),
                    onChanged: (value) {
                      controller.price = value;
                    },
                  ),
                  QTextField(
                    label: "Location",
                    validator: Validator.required,
                    value: item['location'],
                    onChanged: (value) {
                      controller.location = value;
                    },
                  ),
                  QNumberField(
                    label: "Stock",
                    validator: Validator.required,
                    value: item['stock'].toString(),
                    onChanged: (value) {
                      controller.stock = value;
                    },
                  ),
                  QNumberField(
                    label: "Sold",
                    validator: Validator.required,
                    value: item['sold'].toString(),
                    onChanged: (value) {
                      controller.sold = value;
                    },
                  ),
                  QDropdownField(
                    label: "Product Type",
                    validator: Validator.required,
                    items: const [
                      {
                        "label": "Makanan & Minuman",
                        "value": "Makanan & Minuman",
                      },
                      {
                        "label": "Elektronik",
                        "value": "Elektronik",
                      },
                      {
                        "label": "Fashion",
                        "value": "Fashion",
                      },
                      {
                        "label": "Otomotif",
                        "value": "Otomotif",
                      },
                      {
                        "label": "Kesehatan",
                        "value": "Kesehatan",
                      },
                      {
                        "label": "Kecantikan",
                        "value": "Kecantikan",
                      },
                      {
                        "label": "Olahraga",
                        "value": "Olahraga",
                      },
                      {
                        "label": "Hobi",
                        "value": "Hobi",
                      },
                      {
                        "label": "Lainnya",
                        "value": "Lainnya",
                      },
                      {
                        "label": "anime",
                        "value": "anime",
                      },
                    ],
                    value: item['type_product'],
                    
                    onChanged: (value, label) {
                      controller.typeProduct = value;
                    },
                  ),
                  QMemoField(
                    label: "Description",
                    validator: Validator.required,
                    value: item['desc'],
                    onChanged: (value) {
                      controller.desc = value;
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(
            10.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 194, 16, 3),
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(10.0),
            ),
          ),
          onPressed: () {
            controller.submitForm();
          },
          child: const Text(
            "Save Change",
            style: TextStyle(fontSize: 16.0, color: Colors.white),
          ),
        ),
      ),
    );
  }

  
}
