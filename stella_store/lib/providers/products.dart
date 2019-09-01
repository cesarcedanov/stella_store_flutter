import 'package:flutter/material.dart';
import './product.dart';

class Products with ChangeNotifier {
  List<Product> _products = [
    Product(
      id: 'p1',
      title: 'Blusa Agua Lluvia Negra',
      description: 'Una blusa agua lluvia bien linda',
      price: 29.99,
      imageUrl:
          'https://instagram.fhex3-1.fna.fbcdn.net/vp/9bfa6de9d3d091603d5860f9e4125a8a/5DFBE043/t51.2885-15/e35/45736436_275541616469164_5016380213836120064_n.jpg?_nc_ht=instagram.fhex3-1.fna.fbcdn.net',
    ),
    Product(
      id: 'p2',
      title: 'Falsa Larga',
      description: 'Hermosa falta rosada formal',
      price: 59.99,
      imageUrl:
          'https://instagram.fhex3-1.fna.fbcdn.net/vp/37fd30e1f3701d34b914ed6bd21812f5/5E10D1A2/t51.2885-15/e35/45541359_730089810697706_3290632774863552512_n.jpg?_nc_ht=instagram.fhex3-1.fna.fbcdn.net',
    ),
    Product(
      id: 'p3',
      title: 'Vestido corto ',
      description: 'Delicado Vestido Rojo.',
      price: 19.99,
      imageUrl:
          'https://instagram.fhex3-1.fna.fbcdn.net/vp/1e27fb383e74198c75a06cae04c5c458/5E15CD96/t51.2885-15/e35/47689912_1940382362743305_7474052494511833088_n.jpg?_nc_ht=instagram.fhex3-1.fna.fbcdn.net',
    ),
    Product(
      id: 'p4',
      title: 'Abrigo de rayas',
      description: 'Comodo abrigo de rayas negras y blancas. ',
      price: 49.99,
      imageUrl:
          'https://instagram.fhex3-1.fna.fbcdn.net/vp/c497cc0571a20072919c2e1a5c94a55c/5E0DA858/t51.2885-15/e35/47581550_335550513694997_1419897912971755520_n.jpg?_nc_ht=instagram.fhex3-1.fna.fbcdn.net',
    ),
  ];

  List<Product> get products {
    return [..._products];
  }

  void addProduct(product) {
    _products.add(product);
    notifyListeners();
  }

  void toggleFavorite(String id) {}

  Product getById(String id) {
    return _products.firstWhere((item) => item.id == id);
  }
}
