import 'package:flutter/material.dart';
import './product.dart';

class Products with ChangeNotifier {
  List<Product> _products = [
    Product(
      id: 'p1',
      title: 'Blusa Agua Lluvia Negra',
      description:
          'Una blusa agua lluvia bien linda. ᴍᴀʀᴄᴀ: ɢᴀʀᴀɢᴇ. sɪᴢᴇ: s/ᴍ ',
      price: 835,
      imageUrl:
          'https://instagram.fhex3-1.fna.fbcdn.net/vp/9bfa6de9d3d091603d5860f9e4125a8a/5DFBE043/t51.2885-15/e35/45736436_275541616469164_5016380213836120064_n.jpg?_nc_ht=instagram.fhex3-1.fna.fbcdn.net',
    ),
    Product(
      id: 'p2',
      title: 'Falsa Larga',
      description: 'Hermosa falta rosada formal ᴍᴀʀᴄᴀ: ᴅʏɴᴀᴍɪᴛᴇ.  sɪᴢᴇ: s',
      price: 1300,
      imageUrl:
          'https://instagram.fhex3-1.fna.fbcdn.net/vp/37fd30e1f3701d34b914ed6bd21812f5/5E10D1A2/t51.2885-15/e35/45541359_730089810697706_3290632774863552512_n.jpg?_nc_ht=instagram.fhex3-1.fna.fbcdn.net',
    ),
    Product(
      id: 'p3',
      title: 'Blusa Roja',
      description: 'Elegante Blusa Rojo. sɪᴢᴇ : s / ᴍ ',
      price: 19.99,
      imageUrl:
          'https://instagram.fhex3-1.fna.fbcdn.net/vp/1e27fb383e74198c75a06cae04c5c458/5E15CD96/t51.2885-15/e35/47689912_1940382362743305_7474052494511833088_n.jpg?_nc_ht=instagram.fhex3-1.fna.fbcdn.net',
    ),
    Product(
      id: 'p4',
      title: 'Swater Blanco y Negro',
      description:
          'Comodo abrigo de rayas negras y blancas. ᴍᴀʀᴄᴀ: ғᴏʀᴇᴠᴇʀ 21.  sɪᴢᴇ: s ',
      price: 850,
      imageUrl:
          'https://instagram.fhex3-1.fna.fbcdn.net/vp/c497cc0571a20072919c2e1a5c94a55c/5E0DA858/t51.2885-15/e35/47581550_335550513694997_1419897912971755520_n.jpg?_nc_ht=instagram.fhex3-1.fna.fbcdn.net',
    ),
    Product(
      id: 'p5',
      title: 'Falda Corta',
      description: 'Falda Corta. ᴍᴀʀᴄᴀ: ғᴏʀᴇᴠᴇʀ sɪᴢᴇ: 26/27',
      price: 800,
      imageUrl:
          'https://instagram.fhex3-1.fna.fbcdn.net/vp/54272a7ffb3387a34bc380573ef35fa5/5E0D4118/t51.2885-15/e35/46978045_576795776096841_5293312206069301248_n.jpg?_nc_ht=instagram.fhex3-1.fna.fbcdn.net',
    ),
  ];

  var _showFavoritesOnly = false;

  List<Product> get products {
    if (_showFavoritesOnly) {
      return _products.where((product) => product.isFavorite).toList();
    }
    return [..._products];
  }

  void addProduct(Product product) {
    final newProduct = Product(
      id: DateTime.now().toString(),
      title: product.title,
      price: product.price,
      description: product.description,
      imageUrl: product.imageUrl,
    );
    _products.add(newProduct);
    notifyListeners();
  }

  List<Product> get favoriteProducts {
    return _products.where((product) => product.isFavorite).toList();
  }

  Product getById(String id) {
    return _products.firstWhere((item) => item.id == id);
  }
}
