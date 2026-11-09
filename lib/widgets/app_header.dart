import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../screens/cart_screen.dart';
import '../theme/app_theme.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final count = context.watch<CartProvider>().itemCount;
    return Row(
      children: [
        Container(
          height: 46, width: 46,
          decoration: BoxDecoration(color: AppTheme.orange, borderRadius: BorderRadius.circular(14)),
          child: const Icon(Icons.restaurant_menu, color: Colors.white, size: 26),
        ),
        const SizedBox(width: 11),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Bhooka', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 21, letterSpacing: -0.5)),
            Text('HYDERABAD • GOOD FOOD', style: TextStyle(fontSize: 9, letterSpacing: 1.4, color: Colors.grey, fontWeight: FontWeight.bold)),
          ],
        ),
        const Spacer(),
        IconButton(
          tooltip: 'Shopping cart',
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CartScreen())),
          icon: Badge(
            isLabelVisible: count > 0,
            label: Text('$count'),
            child: const Icon(Icons.shopping_bag_outlined, size: 27),
          ),
        ),
      ],
    );
  }
}
