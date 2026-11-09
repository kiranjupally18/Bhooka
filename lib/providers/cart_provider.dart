import 'package:flutter/foundation.dart';
import '../models/food.dart';

class CartProvider extends ChangeNotifier {
  final Map<String, int> _items = {};

  Map<String, int> get items => Map.unmodifiable(_items);
  int get itemCount => _items.values.fold(0, (sum, quantity) => sum + quantity);

  List<Food> get foods => sampleFoods.where((food) => _items.containsKey(food.id)).toList();

  int quantityFor(String id) => _items[id] ?? 0;

  double get subtotal => foods.fold(
        0,
        (sum, food) => sum + food.price * (_items[food.id] ?? 0),
      );

  double get deliveryFee => _items.isEmpty || subtotal >= 499 ? 0 : 30;
  double get total => subtotal + deliveryFee;

  void add(Food food) {
    _items[food.id] = (_items[food.id] ?? 0) + 1;
    notifyListeners();
  }

  void decrement(Food food) {
    final current = _items[food.id] ?? 0;
    if (current <= 1) {
      _items.remove(food.id);
    } else {
      _items[food.id] = current - 1;
    }
    notifyListeners();
  }

  void remove(Food food) {
    _items.remove(food.id);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
