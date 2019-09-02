import 'package:flutter/material.dart';
import '../organisms/products_grid.dart';
import '../organisms/badge.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

enum FilterOptions { FavoritesOnly, All }

class ProductsOverviewPage extends StatefulWidget {
  @override
  _ProductsOverviewPageState createState() => _ProductsOverviewPageState();
}

class _ProductsOverviewPageState extends State<ProductsOverviewPage> {
  var _showFavoritesOnly = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stella Store'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.FavoritesOnly) {
                  _showFavoritesOnly = true;
                } else {
                  _showFavoritesOnly = true;
                }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Show Favorites Only'),
                value: FilterOptions.FavoritesOnly,
              ),
              PopupMenuItem(
                child: Text('Show all'),
                value: FilterOptions.All,
              ),
            ],
          ),
          Consumer<Cart>(
            builder: (_, cart, consumerChild) => Badge(
              child: consumerChild,
              value: cart.totalItemsCount.toString(),
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {},
            ),
          )
        ],
      ),
      body: ProductsGrid(_showFavoritesOnly),
    );
  }
}
