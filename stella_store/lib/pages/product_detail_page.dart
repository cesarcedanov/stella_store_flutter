import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  // final String title;
  // ProductDetailPage(this.title);

  static const routeName = '/product/detail';
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
    );
  }
}
