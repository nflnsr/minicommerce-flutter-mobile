import 'package:minicommerce/state_util.dart';
import 'package:minicommerce/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor:
          Colors.orange.shade400, // Set your desired status bar color here
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Minicommerce',
      navigatorKey: Get.navigatorKey,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: LandingPage(),
      routes: {
        '/': (context) => const ProductListView(),
      },
    );
  }
}
