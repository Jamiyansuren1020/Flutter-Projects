import 'package:commerce_application/components/my_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
// import 'package:lottie/lottie.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          children: [
            Column(
              children: [
                
                DrawerHeader(
                  child: Icon(
                  Icons.shopping_bag,
                  color: Theme.of(context).colorScheme.inversePrimary,
                  size: 72,
                )),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            MyListTile(
              text: 'Shop',
              icon: Icons.home,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            MyListTile(
              text: 'Card',
              icon: Icons.shopping_cart_outlined,
              child: Lottie.asset(
                'assets/Animation - 1702010904360.json',
                height: 50,
                width: 50
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/cart_page');
              },
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 25),
          child: MyListTile(
            text: 'Exit',
            icon: Icons.logout,
            onTap: () =>
              Navigator.pushNamedAndRemoveUntil(context, '/intro_page', (route) => false)
            ,
          ),
        )
      ]),
    );
  }
}
