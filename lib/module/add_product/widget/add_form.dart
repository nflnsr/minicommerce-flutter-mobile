import 'package:flutter/material.dart';
import 'package:minicommerce/shared/utils/validator.dart';
import 'package:minicommerce/shared/widget/form/dropdown.dart';
import 'package:minicommerce/shared/widget/form/memofield.dart';
import 'package:minicommerce/shared/widget/form/number_field.dart';
import 'package:minicommerce/shared/widget/form/text_field.dart';

Widget addForm(BuildContext context, controller){
  return Form(
            key: controller.formKey,
            child: Column(
              children: [
                Column(
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
                    controller.imgProduct == null
                        ? const Text("No Image Selected")
                        : Image.file(controller.imgProduct!),
                  ],
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
                  value: null,
                  onChanged: (value) {
                    controller.productName = value;
                  },
                ),
                QNumberField(
                  label: "Price",
                  validator: Validator.required,
                  value: null,
                  onChanged: (value) {
                    controller.price = value;
                  },
                ),
                QTextField(
                  label: "Location",
                  validator: Validator.required,
                  value: null,
                  onChanged: (value) {
                    controller.location = value;
                  },
                ),
                QNumberField(
                  label: "Stock",
                  validator: Validator.required,
                  value: null,
                  onChanged: (value) {
                    controller.stock = value;
                  },
                ),
                QNumberField(
                  label: "Sold",
                  validator: Validator.required,
                  value: null,
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
                  ],
                  value: null,
                  onChanged: (value, label) {
                    controller.typeProduct = value;
                  },
                ),
                QMemoField(
                  label: "Description",
                  validator: Validator.required,
                  value: null,
                  onChanged: (value) {
                    controller.desc = value;
                  },
                ),
              ],
            ),
          );
}