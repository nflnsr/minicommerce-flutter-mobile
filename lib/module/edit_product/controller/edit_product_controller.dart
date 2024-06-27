import 'dart:io';
import 'package:flutter/material.dart';
import 'package:minicommerce/core.dart';
import 'package:image_picker/image_picker.dart';
import 'package:minicommerce/module/edit_product/view/edit_product_view.dart';
import 'package:minicommerce/shared/utils/format_currency.dart';
import 'package:minicommerce/shared/utils/show_dialog_info.dart';
import 'package:minicommerce/shared/utils/show_loading.dart';

class EditProductController extends State<EditProductView> {
  static late EditProductController instance;
  late EditProductView view;
  late Map<String, dynamic> product = {};
  final String id;

  EditProductController({required this.id});

  @override
  void initState() {
    getProductId(id);
    print("idnya $id");
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

  Future<void> getProductId(String id) async {
    isLoading = true;
    setState(() {});

    product = await ProductService().getById(id);
    // print("product idddd $product['id']");
    // print(product['id']);
    // print("sebelum ini idnya");
    productName = product['product_name'];
    typeProduct = product['type_product'];
    desc = product['desc'];
    price = formatCurrency(product['price']);
    location = product['location'];
    stock = product['stock'].toString();
    sold = product['sold'].toString();
    // imgProduct = product['img_product'];

    isLoading = false;
    setState(() {});
  }

  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image != null) {
      imgProduct = File(image.path);
      print(imgProduct);
      setState(() {});
    }

    return;
  }

  submitForm() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    // print()
    showLoading();
    result = await ProductService().edit(
        id: id,
        productName: productName!,
        typeProduct: typeProduct!,
        desc: desc!,
        price: price!,
        location: location!,
        stock: stock!,
        sold: sold!,
        imgProduct: imgProduct);
    hideLoading();
    setState(() {});
    if (result['message'] == "success") {
      Get.back();
    } else if (result['message'] == "failed") {
      showInfoDialog("Failed to Add Product");
    }
  }
}
