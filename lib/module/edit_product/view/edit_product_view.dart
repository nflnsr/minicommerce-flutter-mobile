import 'package:flutter/material.dart';
import 'package:minicommerce/module/edit_product/widget/edit_form.dart';
import '../controller/edit_product_controller.dart';

class EditProductView extends StatefulWidget {
  final String id;
  const EditProductView({super.key, required this.id});

  @override
  State<EditProductView> createState() => EditProductController(id: id);

  Widget build(context, EditProductController controller) {
    var item = controller.product;
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
                    width: 80,
                    height: 80,
                    child: CircularProgressIndicator(
                      strokeWidth: 5,
                    ),
                  ),
                ),
              )
            : SingleChildScrollView(
                child: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: editForm(context, controller, item)),
              ),
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
            "Save Change",
            style: TextStyle(fontSize: 16.0, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
