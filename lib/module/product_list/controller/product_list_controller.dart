import 'package:flutter/material.dart';
import 'package:minicommerce/core.dart';
import 'package:minicommerce/service/product_service/product_service.dart';
import '../view/product_list_view.dart';

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
  getProducts() async {
    products = await ProductService().get();
    setState(() {});
  }
}
