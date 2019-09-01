import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/product_detail_page.dart';
import '../providers/product.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;

  // ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailPage.routeName,
              arguments: product.id,
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          leading: IconButton(
            icon: product.isFavorite
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border),
            onPressed: product.toggleFavorite,
            color: Theme.of(context).accentColor,
          ),
          trailing: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {},
              color: Theme.of(context).accentColor),
          backgroundColor: Colors.black87,
          title: Text(
            product.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
            ),
            softWrap: true,
            overflow: TextOverflow.fade,
          ),
        ),
      ),
    );
  }
}
