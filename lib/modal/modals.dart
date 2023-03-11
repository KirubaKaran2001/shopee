// ignore_for_file: prefer_final_fields
import 'package:flutter/material.dart';

class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final String image;
  bool isFavourite;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    this.isFavourite = false,
  });
}

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 0});

  void incrementQuantity() {
    quantity = quantity + 1;
  }

  void decrementQuantity() {
    if (quantity > 1) {
      quantity = quantity - 1;
    }
  }
}

class CartProvider extends ChangeNotifier {
  List<CartItem> _items = [];

  Set<Product> _favorites = {};
  int quantity = 1;

  List<CartItem> get items => _items;
  int get itemCount => quantity;
  Set<Product> get favorites => _favorites;

  void addToCart(CartItem item) {
    final index =
        _items.indexWhere((cartItem) => cartItem.product.id == item.product.id);
    _items.add(item);
    quantity++;
    notifyListeners();
  }

  void removeFromCart(CartItem item,context) {
    if (quantity > 0) {
      quantity--;
      if (quantity == 0) {
        Navigator.pop(context);
      }
    }
    notifyListeners();
  }


  addToFavorites(Product product) {
    _favorites.add(product);
    notifyListeners();
  }

  removefavorites(Product product) {
    _favorites.remove(product);
    notifyListeners();
  }

  bool isFavorites(Product product) {
    return _favorites.contains(product);
  }
}
