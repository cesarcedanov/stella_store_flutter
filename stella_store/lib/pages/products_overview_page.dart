import 'package:flutter/material.dart';
import '../organisms/products_grid.dart';

class ProductsOverviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stella Store'),
      ),
      body: new ProductsGrid(),
    );
  }
}
