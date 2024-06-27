import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:minicommerce/shared/utils/validator.dart';
import 'package:minicommerce/shared/widget/form/dropdown.dart';
import 'package:minicommerce/shared/widget/form/memofield.dart';
import 'package:minicommerce/shared/widget/form/number_field.dart';
import 'package:minicommerce/shared/widget/form/text_field.dart';

Widget editForm(BuildContext context, controller, item) {
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
            //controller.imgProduct = item['img_product'],
            controller.imgProduct == null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.memory(
                      base64Decode(item['img_product']),
                      fit: BoxFit.cover,
                      width: double.infinity,
                      // height: 200,
                    ),
                  )
                : Image.file(
                    controller.imgProduct!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  )
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
  );
}
