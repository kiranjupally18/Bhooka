import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'home_screen.dart';

class OrderScreen extends StatelessWidget {
  final String customerName;
  final double total;
  const OrderScreen({super.key, required this.customerName, required this.total});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 0.65, end: 1),
              duration: const Duration(milliseconds: 650),
              curve: Curves.elasticOut,
              builder: (context, scale, child) => Transform.scale(scale: scale, child: child),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(28),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    Container(
                      width: 94, height: 94,
                      decoration: BoxDecoration(color: Colors.green.shade50, shape: BoxShape.circle),
                      child: const Icon(Icons.check_rounded, size: 58, color: Colors.green),
                    ),
                    const SizedBox(height: 20),
                    const Text('Order placed!', style: TextStyle(fontSize: 27, fontWeight: FontWeight.w900)),
                    const SizedBox(height: 8),
                    Text('Thank you, $customerName. Your delicious food is being prepared.', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey.shade600, height: 1.4)),
                    const SizedBox(height: 22),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(color: Colors.orange.shade50, borderRadius: BorderRadius.circular(16)),
                      child: Column(children: [
                        const Text('DEMO ORDER CONFIRMATION', style: TextStyle(fontSize: 10, letterSpacing: 1, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        Text('BH${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}', style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 19)),
                        const SizedBox(height: 6),
                        Text('Total paid: ₹${total.toStringAsFixed(0)}', style: const TextStyle(fontWeight: FontWeight.bold)),
                      ]),
                    ),
                    const SizedBox(height: 22),
                    SizedBox(width: double.infinity, child: ElevatedButton(
                      onPressed: () => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const HomeScreen()), (route) => false),
                      child: const Text('Back to home'),
                    )),
                  ]),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
