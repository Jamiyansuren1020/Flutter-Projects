import 'package:commerce_application/components/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;
import '../components/my_drawer.dart';
import '../models/shop.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shop;
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop Page'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          badges.Badge(
            position: badges.BadgePosition.topEnd(top: 2, end: 4),
            badgeAnimation: const badges.BadgeAnimation.slide(),
            badgeStyle: badges.BadgeStyle(
              badgeColor: Colors.red.withOpacity(0.9),
            ),
            badgeContent: Text((cart.length).toString(), style: const TextStyle(color: Colors.white),),

            child: IconButton(
                onPressed: () => Navigator.pushNamed(context, '/cart_page'),
                icon: const Icon(Icons.shopping_cart_outlined)),
          ),
        
        ],
      ),
      drawer: const MyDrawer(),
      body: ListView(
        children: [
          SizedBox(
            height: 25,
          ),
          Center(
              child: Text(
            'Pick form selected premium products',
            style:
                TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
          )),
          SizedBox(
            height: 550,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                padding: const EdgeInsets.all(15),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ProductTile(product: product);
                }),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}
