// ignore_for_file: avoid_print, must_be_immutable

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
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
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
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
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
              if (product!.category == 'men\'s clothing')
                Text(
                  'Choose your Size',
                  style: priceStyle.copyWith(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              if (product!.category == 'men\'s clothing')
                const SizedBox(
                  height: 10,
                ),
              if (product!.category == 'men\'s clothing' && product!.id != 1)
                Row(
                  children: [
                    SizeWidget(
                      size: 'S',
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizeWidget(
                      size: 'M',
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizeWidget(
                      size: 'L',
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizeWidget(
                      size: 'XL',
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizeWidget(
                      size: 'XXL',
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
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
                        border: Border.all(
                          color: const Color(0xffeb8a17),
                        ),
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
                                  CartItem(product: product!), context);
                            },
                            icon: const Icon(Icons.minimize),
                          ),
                        ),
                        Text(
                          '$cartCount',
                          style: cartTitleStyle.copyWith(
                            fontSize: 15,
                          ),
                        ),
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
              const SizedBox(
                height: 40,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Color(0xffeb8a17),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.shopping_cart),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Buy Now'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SizeWidget extends StatelessWidget {
  String? size;
  SizeWidget({
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffeb8a17)),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(size!),
      ),
    );
  }
}
