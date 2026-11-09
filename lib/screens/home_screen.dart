import 'package:flutter/material.dart';
import '../models/food.dart';
import '../theme/app_theme.dart';
import '../widgets/app_header.dart';
import '../widgets/food_card.dart';
import 'menu_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final columns = width >= 1100 ? 4 : width >= 700 ? 3 : 2;
    final popular = sampleFoods.where((f) => f.isPopular && f.name.toLowerCase().contains(query.toLowerCase())).toList();

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1180),
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(20, 18, 20, 10),
                  sliver: SliverToBoxAdapter(child: AppHeader()),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  sliver: SliverToBoxAdapter(
                    child: TextField(
                      onChanged: (v) => setState(() => query = v),
                      decoration: const InputDecoration(
                        hintText: 'Search for your favourite food...',
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: Icon(Icons.tune),
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  sliver: SliverToBoxAdapter(
                    child: Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(colors: [Color(0xFFFF8A3D), Color(0xFFFF632B)]),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        children: [
                          Expanded(child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('HYDERABAD FOOD SPECIALS', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1.2, fontSize: 11)),
                              const SizedBox(height: 10),
                              const Text('Authentic Hyderabad\\nflavours, made fresh!', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 27, height: 1.15)),
                              const SizedBox(height: 9),
                              const Text('Discover biryani, kebabs and local favourites', style: TextStyle(color: Colors.white, fontSize: 13)),
                              const SizedBox(height: 16),
                              OutlinedButton(
                                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const MenuScreen())),
                                style: OutlinedButton.styleFrom(foregroundColor: AppTheme.orange, backgroundColor: Colors.white, side: BorderSide.none),
                                child: const Text('ORDER NOW'),
                              ),
                            ],
                          )),
                          if (width > 480)
                            const Icon(Icons.lunch_dining, color: Colors.white70, size: 112),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(20, 25, 20, 12),
                  sliver: SliverToBoxAdapter(child: Row(
                    children: [
                      const Expanded(child: Text('Explore categories', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800))),
                      TextButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const MenuScreen())), child: const Text('See all')),
                    ],
                  )),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 105,
                    child: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      scrollDirection: Axis.horizontal,
                      children: const [
                        _CategoryChip(icon: Icons.grid_view_rounded, label: 'All'),
                        _CategoryChip(icon: Icons.rice_bowl, label: 'Biryani'),
                        _CategoryChip(icon: Icons.restaurant, label: 'Hyderabadi'),
                        _CategoryChip(icon: Icons.restaurant_menu, label: 'Starters'),
                        _CategoryChip(icon: Icons.local_fire_department, label: 'Curries'),
                        _CategoryChip(icon: Icons.icecream, label: 'Desserts'),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(20, 15, 20, 12),
                  sliver: SliverToBoxAdapter(child: Row(children: [
                    const Expanded(child: Text('Popular right now', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800))),
                    TextButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const MenuScreen())), child: const Text('View menu')),
                  ])),
                ),
                if (popular.isEmpty)
                  const SliverToBoxAdapter(child: Padding(padding: EdgeInsets.all(24), child: Text('No popular dishes match your search.')))
                else
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 25),
                    sliver: SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: columns,
                        crossAxisSpacing: 14,
                        mainAxisSpacing: 14,
                        childAspectRatio: width < 420 ? 0.68 : width < 700 ? 0.78 : 0.82,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => FoodCard(food: popular[index]),
                        childCount: popular.length,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final IconData icon;
  final String label;
  const _CategoryChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(right: 12),
    child: InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => MenuScreen(initialCategory: label))),
      child: Container(
        width: 83,
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18), border: Border.all(color: Colors.orange.shade50)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(icon, color: AppTheme.orange, size: 27),
          const SizedBox(height: 7),
          Text(label, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600)),
        ]),
      ),
    ),
  );
}
