import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopee/modal/modals.dart';
import 'package:shopee/screens/cart_screen.dart';
import 'package:shopee/screens/details.dart';
import 'package:shopee/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ProductsScreen(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (RouteSettings settings) {
          debugPrint('build route for ${settings.name}');
          var routes = <String, WidgetBuilder>{
            '/homeScreen': (BuildContext context) => ProductsScreen(),
            // '/cartScreen': (BuildContext context) =>
            //     CartScreen(settings.arguments as Map<String, dynamic>),
            '/detailScreen': (BuildContext context) =>
                DetailsScreen(settings.arguments as Product),
          };
          WidgetBuilder builder = routes[settings.name]!;
          return MaterialPageRoute(
            builder: (ctx) => builder(ctx),
          );
        },
      ),
    );
  }
}
