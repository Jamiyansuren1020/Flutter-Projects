import 'package:commerce_application/components/my_button.dart';
import 'package:commerce_application/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slide_to_act/slide_to_act.dart';

import '../models/product.dart';

class CartPage extends StatelessWidget {
  
  CartPage({super.key, required});
  

  // double calculateTotal(Product product) {
  //   double total = 0.0;
  //   for(Product product){
  //     total += product.price;
  //   }
  //   return total;
  // }

  void removeItemFromCart(BuildContext context, Product product) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content:
                  const Text('Are you sure want to remove item from the cart?'),
              actions: [
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('No'),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                    context.read<Shop>().removeFromCart(product);
                  },
                  child: const Text('Yes'),
                )
              ],
            ));
  }

  void payButtonPressed(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              content: Text('User wants to pay'),
            ));
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;
    final products = context.watch<Shop>().shop;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Cart Page'),
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Column(
        children: [
          Expanded(
              child: cart.isEmpty
                  ? const Center(
                      child: Text(
                      'Your cart is empty',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ))
                  : ListView.builder(
                      itemCount: cart.length,
                      itemBuilder: (context, index) {
                        final item = cart[index];
                        final product = products[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white54,
                                borderRadius: BorderRadius.circular(12)),
                            child: ListTile(
                                leading: Image.asset(product.imagePath, width: 80,),
                                title: Row(
                                  children: [
                                    Text(item.name),
                                  ],
                                ),
                                subtitle: Text(item.price.toStringAsFixed(2)),
                                trailing: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: IconButton(
                                      onPressed: () =>
                                          removeItemFromCart(context, item),
                                      icon: const Icon(Icons.remove),
                                    ),
                                  ),
                                )),
                          ),
                        );
                      })),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SlideAction(
              onSubmit: () {
                payButtonPressed(context);
              },
              borderRadius: 12,
              elevation: 0,
              innerColor: Theme.of(context).colorScheme.inversePrimary,
              text: '\$${context.watch<Shop>().calculateTotal()} Slide to pay',
              textColor: Theme.of(context).colorScheme.primary,
              textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          )
          // MyButton(
          //     onTap: () {
          //       payButtonPressed(context);
          //     },
          //     buttonchild: Text('Pay Now'))
        ],
      ),
    );
  }
}
