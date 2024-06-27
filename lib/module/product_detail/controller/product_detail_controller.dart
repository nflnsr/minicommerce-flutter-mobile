import 'package:flutter/material.dart';
import 'package:minicommerce/core.dart';
import 'package:minicommerce/shared/utils/show_loading.dart';

class ProductDetailController extends State<ProductDetailView> {
  static late ProductDetailController instance;
  late ProductDetailView view;
  final String productid;
  late Map<String, dynamic> product;
  bool isLoading = true;

  ProductDetailController({required this.productid});

  @override
  void initState() {
    super.initState();
    instance = this;
    getProductById(productid);
    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());
  }

  void onReady() {}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  Future<void> getProductById(String id) async {
    isLoading = true;

    product = await ProductService().getById(id);
    isLoading = false;
    setState(() {});
  }

  deleteProduct(String id) async {
    showLoading();
    await ProductService().delete(id);
    hideLoading();
    Get.back();
  }
}
