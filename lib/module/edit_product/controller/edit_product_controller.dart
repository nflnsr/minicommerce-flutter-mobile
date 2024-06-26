import 'dart:io';
import 'package:flutter/material.dart';
import 'package:minicommerce/core.dart';
import 'package:image_picker/image_picker.dart';
import 'package:minicommerce/module/edit_product/view/edit_product_view.dart';
import 'package:minicommerce/shared/utils/show_dialog_info.dart';
import 'package:minicommerce/shared/utils/show_loading.dart';

class EditProductController extends State<EditProductView> {
  static late EditProductController instance;
  late EditProductView view;
  late Map<String,dynamic> product = {};
  final String id;

  EditProductController({required this.id});

  @override
  void initState() {
    getProductId(id);
    
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

  Future<void> getProductId(String id) async {
    isLoading = true;
    
    product = await ProductService().getById(id);
    isLoading = false;
    setState(() {});
  }

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
