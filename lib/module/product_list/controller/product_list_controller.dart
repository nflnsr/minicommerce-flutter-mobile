import 'package:flutter/material.dart';
import 'package:minicommerce/core.dart';
import 'package:minicommerce/shared/utils/show_loading.dart';

class ProductListController extends State<ProductListView> {
  static late ProductListController instance;
  late ProductListView view;

  @override
  void initState() {
    super.initState();
    instance = this;
    getProducts();
    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());
  }

  void onReady() {}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  List products = [];
  bool isLoading = true;
  getProducts() async {
    isLoading = true;
    setState(() {});
    products = await ProductService().get();
    isLoading = false;
    setState(() {});
  }

  deleteProduct(String id) async {
    showLoading();
    await ProductService().delete(id);
    hideLoading();
    getProducts();
  }

}
