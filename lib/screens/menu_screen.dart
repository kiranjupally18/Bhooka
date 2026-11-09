import 'package:flutter/material.dart';
import '../models/food.dart';
import '../widgets/app_header.dart';
import '../widgets/food_card.dart';

class MenuScreen extends StatefulWidget {
  final String initialCategory;
  const MenuScreen({super.key, this.initialCategory = 'All'});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  late String selected;
  String query = '';

  @override
  void initState() {
    super.initState();
    selected = widget.initialCategory;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final columns = width >= 1100 ? 4 : width >= 700 ? 3 : 2;
    final foods = sampleFoods.where((f) =>
      (selected == 'All' || f.category == selected) &&
      f.name.toLowerCase().contains(query.toLowerCase())).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Our Menu', style: TextStyle(fontWeight: FontWeight.w800))),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1180),
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.fromLTRB(20, 4, 20, 12), child: AppHeader()),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(onChanged: (v) => setState(() => query = v), decoration: const InputDecoration(prefixIcon: Icon(Icons.search), hintText: 'Search menu')),
              ),
              SizedBox(
                height: 60,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  children: foodCategories.map((c) => Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(label: Text(c), selected: selected == c, onSelected: (_) => setState(() => selected = c)),
                  )).toList(),
                ),
              ),
              Expanded(
                child: foods.isEmpty
                  ? const Center(child: Text('No dishes found. Try another search.'))
                  : GridView.builder(
                      padding: const EdgeInsets.fromLTRB(20, 4, 20, 24),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: columns,
                        crossAxisSpacing: 14,
                        mainAxisSpacing: 14,
                        childAspectRatio: width < 420 ? 0.68 : width < 700 ? 0.78 : 0.82,
                      ),
                      itemCount: foods.length,
                      itemBuilder: (_, i) => FoodCard(food: foods[i]),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
