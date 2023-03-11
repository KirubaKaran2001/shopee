// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shopee/constants/constants.dart';
// import 'package:shopee/modal/modals.dart';

// class CartScreen extends StatefulWidget {
//   final Map<String, dynamic>? product;

//   const CartScreen(this.product, {super.key});

//   @override
//   State<CartScreen> createState() => _CartScreenState();
// }

// class _CartScreenState extends State<CartScreen> {
//   Map<String, dynamic>? product;

//   @override
//   void initState() {
//     super.initState();
//     product = widget.product;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Shopee'),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 '${product!['title']}',
//                 style: cartTitleStyle,
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Center(
//                 child: Image.network(
//                   product!['image'],
//                   height: 300,
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Text(
//                 product!['description'].toString(),
//                 style: descriptionStyle,
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Text(
//                 '\$ ${product!['price'].toString()}',
//                 style: const TextStyle(
//                   fontSize: 30,
//                   fontStyle: FontStyle.normal,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Row(
//                 children: [
//                   Card(
//                     child: Expanded(
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           IconButton(
//                             onPressed: () {
//                               Provider.of<Shopee>(context, listen: false)
//                                   .decrementCart();
//                             },
//                             icon: const Icon(Icons.minimize_outlined),
//                           ),
//                           Consumer<Shopee>(
//                             builder: (context, shopee, child) {
//                               return Text(
//                                 shopee.incrementItemList.toString(),
//                               );
//                             },
//                           ),
//                           IconButton(
//                             onPressed: () {
//                               Provider.of<Shopee>(context, listen: false)
//                                   .incrementCart();
//                             },
//                             icon: const Icon(Icons.add),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   var item = Products(
//                     id: product!['id'],
//                     image: product!['image'],
//                     title: product!['title'],
//                     price: product!['price'],
//                     description: product!['description'],
//                     count: product!['count'],
//                   );
//                   var cart = Provider.of<Shopee>(context, listen: false);
//                   cart.addToCart(item);
//                 },
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: const [
//                     Icon(Icons.shopify_sharp),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     Text('Buy Now'),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
