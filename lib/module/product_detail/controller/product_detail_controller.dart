import 'package:flutter/material.dart';
import 'package:minicommerce/core.dart';
import '../view/product_detail_view.dart';
import 'dart:convert';

class ProductDetailController extends State<ProductDetailView> {
  static late ProductDetailController instance;
  late ProductDetailView view;

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

  Map<dynamic, dynamic> product = jsonDecode('''
    {
      "id": 1,
      "name": "Product 1",
      "price": 1000,
      "description": "This is product 1",
      "image": "https://res.cloudinary.com/dotz74j1p/raw/upload/v1716045088/aqwqm57kunudfs2y5swr.png"
    }
  ''');

  // getProduct() async {
  //   product = await ProductService().getById(); // give the product id to fetch data
  //   setState(() {});
  // }
}
