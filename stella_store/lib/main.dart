import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './pages/products_overview_page.dart';
import './pages/product_detail_page.dart';
import './providers/products.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (ctx) => Products(),
      child: MaterialApp(
        title: 'Stella Store',
        theme: ThemeData(
          primaryColor: Color.fromRGBO(50, 150, 195, 1),
          accentColor: Color.fromRGBO(235, 150, 165, 1),
          fontFamily: 'Lato',
        ),
        home: ProductsOverviewPage(),
        routes: {
          ProductDetailPage.routeName: (ctx) => ProductDetailPage(),
        },
      ),
    );
  }
}
