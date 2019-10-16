import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './pages/products_overview_page.dart';
import './pages/product_detail_page.dart';
import './pages/cart_page.dart';
import './providers/products.dart';
import './providers/cart.dart';
import './providers/orders.dart';
import './pages/orders_page.dart';
import './pages/user_products_page.dart';
import './pages/edit_product_page.dart';
import './pages/auth_page.dart';
import './providers/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: Auth(),
          ),
          ChangeNotifierProxyProvider<Auth, Products>(
            builder: (ctx, auth, previousProducts) => Products(
                auth.token,
                auth.userId,
                previousProducts == null ? [] : previousProducts.products),
          ),
          ChangeNotifierProvider.value(
            value: Cart(),
          ),
          ChangeNotifierProxyProvider<Auth, Orders>(
            builder: (ctx, auth, previousOrders) => Orders(
                auth.token,
                auth.userId,
                previousOrders == null ? [] : previousOrders.orders),
          )
        ],
        child: Consumer<Auth>(
          builder: (ctx, auth, _) => MaterialApp(
            debugShowCheckedModeBanner: false, // NEEDS TO BE REMOVED
            title: 'Stella Store',
            theme: ThemeData(
              primaryColor: Color.fromRGBO(50, 150, 195, 1),
              accentColor: Color.fromRGBO(235, 150, 165, 1),
              fontFamily: 'Lato',
            ),
            home: auth.isAuth ? ProductsOverviewPage() : AuthScreen(),
            routes: {
              ProductDetailPage.routeName: (ctx) => ProductDetailPage(),
              CartPage.routeName: (ctx) => CartPage(),
              OrdersPage.routeName: (ctx) => OrdersPage(),
              UserProductsPage.routeName: (ctx) => UserProductsPage(),
              EditProductPage.routeName: (ctx) => EditProductPage(),
            },
          ),
        ));
  }
}
