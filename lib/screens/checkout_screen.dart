import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import 'order_screen.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _phone = TextEditingController();
  final _address = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _phone.dispose();
    _address.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout', style: TextStyle(fontWeight: FontWeight.w800))),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(22),
                child: Form(
                  key: _formKey,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    const Text('Delivery details', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
                    const SizedBox(height: 6),
                    Text('Please enter where we should deliver your food.', style: TextStyle(color: Colors.grey.shade600)),
                    const SizedBox(height: 22),
                    _field(_name, 'Full name', Icons.person_outline, (v) => (v == null || v.trim().length < 3) ? 'Enter your full name' : null),
                    const SizedBox(height: 14),
                    _field(_phone, 'Mobile number', Icons.phone_outlined, (v) => (v == null || !RegExp(r'^[6-9][0-9]{9}$').hasMatch(v.trim())) ? 'Enter a valid 10-digit Indian mobile number' : null, keyboard: TextInputType.phone),
                    const SizedBox(height: 14),
                    _field(_address, 'Delivery address', Icons.location_on_outlined, (v) => (v == null || v.trim().length < 10) ? 'Enter a complete address (at least 10 characters)' : null, maxLines: 3),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(color: Colors.orange.shade50, borderRadius: BorderRadius.circular(14)),
                      child: Row(children: [
                        const Expanded(child: Text('Amount to pay', style: TextStyle(fontWeight: FontWeight.bold))),
                        Text('₹${cart.total.toStringAsFixed(0)}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
                      ]),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(width: double.infinity, child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate() && cart.items.isNotEmpty) {
                          final orderTotal = cart.total;
                          final orderName = _name.text.trim();
                          cart.clear();
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => OrderScreen(customerName: orderName, total: orderTotal)));
                        }
                      },
                      child: const Text('Place order (demo)'),
                    )),
                    const SizedBox(height: 8),
                    const Center(child: Text('Demo checkout • No real payment is collected', style: TextStyle(fontSize: 11, color: Colors.grey))),
                  ]),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _field(TextEditingController controller, String label, IconData icon, String? Function(String?) validator, {TextInputType keyboard = TextInputType.text, int maxLines = 1}) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboard,
      maxLines: maxLines,
      validator: validator,
      decoration: InputDecoration(labelText: label, prefixIcon: Icon(icon, size: 20), alignLabelWithHint: maxLines > 1),
    );
  }
}
