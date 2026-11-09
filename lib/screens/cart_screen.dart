import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../theme/app_theme.dart';
import 'checkout_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();
    return Scaffold(
      appBar: AppBar(title: const Text('My Cart', style: TextStyle(fontWeight: FontWeight.w800))),
      body: cart.items.isEmpty
        ? Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
            const Icon(Icons.shopping_bag_outlined, size: 76, color: Colors.black26),
            const SizedBox(height: 14),
            const Text('Your cart is empty', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text('Add something delicious from our menu.'),
            const SizedBox(height: 18),
            ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text('Explore menu')),
          ]))
        : Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 850),
              child: Column(children: [
                Expanded(child: ListView(
                  padding: const EdgeInsets.all(18),
                  children: cart.foods.map((food) {
                    final qty = cart.quantityFor(food.id);
                    return Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(food.imageUrl, width: 82, height: 82, fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) => Container(width: 82, height: 82, color: Colors.orange.shade50, child: const Icon(Icons.fastfood))),
                          ),
                          const SizedBox(width: 13),
                          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Text(food.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                            const SizedBox(height: 5),
                            Text('₹${food.price.toStringAsFixed(0)} each', style: TextStyle(color: Colors.grey.shade600)),
                            Text('₹${(food.price * qty).toStringAsFixed(0)}', style: const TextStyle(fontWeight: FontWeight.w800, color: AppTheme.orange)),
                          ])),
                          Row(children: [
                            IconButton(onPressed: () => cart.decrement(food), icon: const Icon(Icons.remove_circle_outline)),
                            Text('$qty', style: const TextStyle(fontWeight: FontWeight.bold)),
                            IconButton(onPressed: () => cart.add(food), icon: const Icon(Icons.add_circle_outline)),
                          ]),
                        ]),
                      ),
                    );
                  }).toList(),
                )),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 22),
                  decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
                  child: Column(children: [
                    _PriceLine(label: 'Subtotal', value: cart.subtotal),
                    _PriceLine(label: 'Delivery fee', value: cart.deliveryFee),
                    const Divider(height: 20),
                    _PriceLine(label: 'Total', value: cart.total, bold: true),
                    const SizedBox(height: 15),
                    SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CheckoutScreen())), child: const Text('Proceed to checkout'))),
                  ]),
                ),
              ]),
            ),
          ),
    );
  }
}

class _PriceLine extends StatelessWidget {
  final String label;
  final double value;
  final bool bold;
  const _PriceLine({required this.label, required this.value, this.bold = false});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(children: [
      Text(label, style: TextStyle(fontWeight: bold ? FontWeight.w800 : FontWeight.normal, fontSize: bold ? 17 : 14)),
      const Spacer(),
      Text('₹${value.toStringAsFixed(0)}', style: TextStyle(fontWeight: bold ? FontWeight.w900 : FontWeight.w600, fontSize: bold ? 18 : 14)),
    ]),
  );
}
