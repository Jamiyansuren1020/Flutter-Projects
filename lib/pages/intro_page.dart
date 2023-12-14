import 'package:commerce_application/components/my_button.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_cart_outlined, size: 72, color: Theme.of(context).colorScheme.inversePrimary,),
            const SizedBox(height: 25,),
            const Text('Welcome to Temiu', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
            Text('Make your shopping more fun', style: TextStyle(color:Theme.of(context).colorScheme.inversePrimary),),
            const SizedBox(height: 25),
            MyButton(onTap: () => Navigator.pushNamed(context, '/shop_page'),
             buttonchild: const Icon(Icons.arrow_forward))
            ]
            )),
    );
  }
}
