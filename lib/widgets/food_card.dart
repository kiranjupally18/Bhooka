import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/food.dart';
import '../providers/cart_provider.dart';
import '../theme/app_theme.dart';

class FoodCard extends StatelessWidget {
  final Food food;
  const FoodCard({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();
    final quantity = cart.quantityFor(food.id);
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 1.35,
                child: Image.network(
                  food.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    color: Colors.orange.shade50,
                    child: const Icon(Icons.restaurant, size: 48, color: AppTheme.orange),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                  child: Row(children: [
                    Icon(Icons.circle, size: 9, color: food.isVeg ? Colors.green : Colors.red),
                    const SizedBox(width: 5),
                    Text(food.isVeg ? 'VEG' : 'NON-VEG', style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                  ]),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(13, 12, 13, 13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Expanded(child: Text(food.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15))),
                  const Icon(Icons.star, color: Colors.amber, size: 16),
                  Text(food.rating.toString(), style: const TextStyle(fontSize: 12)),
                ]),
                const SizedBox(height: 5),
                Text(food.description, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.grey.shade600, fontSize: 12, height: 1.3)),
                const SizedBox(height: 12),
                Row(children: [
                  Text('₹${food.price.toStringAsFixed(0)}', style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w800)),
                  const Spacer(),
                  if (quantity == 0)
                    SizedBox(
                      height: 36,
                      child: ElevatedButton(
                        onPressed: () => cart.add(food),
                        style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0)),
                        child: const Text('ADD'),
                      ),
                    )
                  else
                    Container(
                      decoration: BoxDecoration(color: AppTheme.orange, borderRadius: BorderRadius.circular(12)),
                      child: Row(mainAxisSize: MainAxisSize.min, children: [
                        _QtyButton(icon: Icons.remove, onTap: () => cart.decrement(food)),
                        Text('$quantity', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        _QtyButton(icon: Icons.add, onTap: () => cart.add(food)),
                      ]),
                    ),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _QtyButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _QtyButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) => IconButton(
        visualDensity: VisualDensity.compact,
        onPressed: onTap,
        icon: Icon(icon, color: Colors.white, size: 18),
      );
}
