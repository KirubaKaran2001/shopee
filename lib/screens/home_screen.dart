// ignore_for_file: library_private_types_in_public_api, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:shopee/constants/constants.dart';
import 'package:shopee/modal/modals.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  List<Product> _products = [];

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final favourites = cartProvider.favorites;
    return Scaffold(
      body: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white60,
                      child: Image.asset(
                        'assets/profile.png',
                        height: 35,
                      ),
                    ),
                    Text(
                      'Shopee',
                      style: headerStyle,
                    ),
                    const Icon(
                      Icons.search,
                      size: 25,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      maxCrossAxisExtent: 300,
                      mainAxisExtent: 300,
                    ),
                    itemCount: _products.length,
                    itemBuilder: (context, index) {
                      final product = _products[index];
                      final isfavourite = favourites.contains(product);
                      if (product != null) {
                        return GestureDetector(
                          onTap: () async {
                            Navigator.pushNamed(
                              context,
                              '/detailScreen',
                              arguments: product,
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black12,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          if (isfavourite) {
                                            cartProvider
                                                .removefavorites(product);
                                          } else {
                                            cartProvider
                                                .addToFavorites(product);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                            content:
                                                Text('Item added to Favorites'),
                                          ));
                                          }
                                        },
                                        icon: Icon(
                                          (isfavourite == true)
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                        ),
                                        color: (isfavourite == true)
                                            ? Colors.red
                                            : Colors.black54,
                                      ),
                                      IconButton(
                                        icon: const Icon(
                                          Icons.add,
                                          color: Color(0xffeb8a17),
                                        ),
                                        onPressed: () {
                                          Navigator.pushNamed(
                                            context,
                                            '/cartScreen',
                                          );
                                        },
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Image.network(
                                    product.image.toString(),
                                    height: 100,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Flexible(
                                    child: Text(
                                      product.title,
                                      style: titleStyle,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    '\$ ${product.price.toString()}',
                                    style: priceStyle,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _fetchProducts() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      final products = data.map((item) {
        return Product(
            id: item['id'],
            title: item['title'],
            description: item['description'],
            price: item['price'].toDouble(),
            image: item['image'],
            category: item['category']);
      }).toList();
      setState(() {
        _products = products;
      });
    } else {
      throw Exception('Failed to fetch products');
    }
  }
}
