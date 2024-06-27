import 'package:flutter/material.dart';
import 'package:minicommerce/core.dart';
import 'package:minicommerce/module/add_product/widget/add_form.dart';
import '../controller/add_product_controller.dart';

class AddProductView extends StatefulWidget {
  const AddProductView({super.key});

  Widget build(context, AddProductController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Product"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(10.0),
            child: addForm(context, controller)),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 194, 16, 3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          onPressed: () {
            controller.submitForm();
          },
          child: const Text(
            "Submit",
            style: TextStyle(fontSize: 16.0, color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  State<AddProductView> createState() => AddProductController();
}
