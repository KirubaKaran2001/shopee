import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Shopee'),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return SafeArea(
              child: Scaffold(
                body: Column(
                  children: [
                    Text('data')
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
