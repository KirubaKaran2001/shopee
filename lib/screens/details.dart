// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopee/constants/constants.dart';
import 'package:shopee/modal/modals.dart';

class DetailsScreen extends StatefulWidget {
  final Product product;

  const DetailsScreen(this.product, {super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  Product? product;
  @override
  void initState() {
    super.initState();
    product = widget.product;
    print(product);
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartCount = cartProvider.itemCount;
    final cartTotal = product!.price * cartCount;
    
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 25,
                      // color: Colors.white60,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.favorite_border,
                      size: 25,
                      color: Colors.white60,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            // const SizedBox(
            //   height: 20,
            // ),
            Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    product!.image,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product!.title,
                    style: cartTitleStyle,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    product!.description,
                    style: descriptionStyle,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 120,
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 8.0,
                                bottom: 10,
                              ),
                              child: IconButton(
                                onPressed: () {
                                  cartProvider.removeFromCart(
                                      CartItem(product: product!),context);
                                },
                                icon: const Icon(Icons.minimize),
                              ),
                            ),
                            Text('$cartCount'),
                            IconButton(
                              onPressed: () {
                                cartProvider.addToCart(
                                  CartItem(product: product!),
                                );
                              },
                              icon: const Icon(Icons.add),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        '\$${cartTotal.toString()}',
                        style: descriptionStyle.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
