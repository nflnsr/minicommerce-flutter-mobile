import 'dart:io';
import 'package:flutter/material.dart';
import 'package:minicommerce/core.dart';
import 'package:image_picker/image_picker.dart';
import 'package:minicommerce/shared/utils/show_dialog_info.dart';
import 'package:minicommerce/shared/utils/show_loading.dart';

class AddProductController extends State<AddProductView> {
  static late AddProductController instance;
  late AddProductView view;

  @override
  void initState() {
    super.initState();
    instance = this;
    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());
  }

  void onReady() {}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  File? imgProduct;
  String? productName;
  String? typeProduct;
  String? desc;
  String? price;
  String? location;
  String? stock;
  String? sold;

  bool isLoading = true;
  // ignore: prefer_typing_uninitialized_variables
  var result;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image != null) {
      imgProduct = File(image.path);
      setState(() {});
    }

    return;
  }

  submitForm() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    showLoading();
    result = await ProductService().add(
        productName: productName!,
        typeProduct: typeProduct!,
        desc: desc!,
        price: price!,
        location: location!,
        stock: stock!,
        sold: sold!,
        imgProduct: imgProduct);
    print("resulttt: $result");
    hideLoading();
    setState(() {});
    if (result['message'] == "success") {
      Get.back();
    } else if (result['message'] == "failed") {
      showInfoDialog("Failed to Add Product");
    }
  }
}
