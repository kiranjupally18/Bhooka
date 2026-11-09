class Food {
  final String id;
  final String name;
  final String description;
  final String category;
  final double price;
  final String imageUrl;
  final bool isVeg;
  final double rating;
  final bool isPopular;

  const Food({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.price,
    required this.imageUrl,
    required this.isVeg,
    this.rating = 4.5,
    this.isPopular = false,
  });
}

const List<Food> sampleFoods = [
  Food(id: 'f1', name: 'Chicken Dum Biryani', description: 'Aromatic basmati rice layered with spicy chicken and dum-cooked masala', category: 'Biryani', price: 269, imageUrl: 'https://images.unsplash.com/photo-1563379091339-03246963d96c?w=900', isVeg: false, rating: 4.9, isPopular: true),
  Food(id: 'f2', name: 'Mutton Dum Biryani', description: 'Tender mutton slow-cooked with fragrant Hyderabadi spices', category: 'Biryani', price: 329, imageUrl: 'https://images.unsplash.com/photo-1633945274405-b6c8069047b0?w=900', isVeg: false, rating: 4.9, isPopular: true),
  Food(id: 'f3', name: 'Hyderabadi Haleem', description: 'Slow-cooked wheat, lentils and meat with traditional spices', category: 'Hyderabadi', price: 220, imageUrl: 'https://images.unsplash.com/photo-1547592180-85f173990554?w=900', isVeg: false, rating: 4.8, isPopular: true),
  Food(id: 'f4', name: 'Mutton Nihari', description: 'Rich and slow-simmered mutton curry with warming spices', category: 'Curries', price: 280, imageUrl: 'https://images.unsplash.com/photo-1585937421612-70a008356fbe?w=900', isVeg: false, rating: 4.7),
  Food(id: 'f5', name: 'Pathar ka Gosht', description: 'Traditional stone-grilled mutton with a bold spice marinade', category: 'Starters', price: 310, imageUrl: 'https://images.unsplash.com/photo-1544025162-d76694265947?w=900', isVeg: false, rating: 4.7),
  Food(id: 'f6', name: 'Mirchi ka Salan', description: 'Tangy peanut and sesame curry with green chillies', category: 'Curries', price: 150, imageUrl: 'https://images.unsplash.com/photo-1631452180519-c014fe946bc7?w=900', isVeg: true, rating: 4.5),
  Food(id: 'f7', name: 'Bagara Baingan', description: 'Baby brinjals simmered in a nutty Hyderabadi gravy', category: 'Curries', price: 170, imageUrl: 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=900', isVeg: true, rating: 4.6),
  Food(id: 'f8', name: 'Lukhmi', description: 'Crispy square pastry filled with spiced minced meat', category: 'Snacks', price: 120, imageUrl: 'https://images.unsplash.com/photo-1601050690597-df0568f70950?w=900', isVeg: false, rating: 4.6),
  Food(id: 'f9', name: 'Keema Samosa', description: 'Golden pastry pockets filled with savoury minced meat', category: 'Snacks', price: 110, imageUrl: 'https://images.unsplash.com/photo-1601050690117-94f5f6fa8bd7?w=900', isVeg: false, rating: 4.5),
  Food(id: 'f10', name: 'Boti Kebab', description: 'Juicy pieces of marinated meat grilled over a flame', category: 'Starters', price: 260, imageUrl: 'https://images.unsplash.com/photo-1599487488170-d11ec9c172f0?w=900', isVeg: false, rating: 4.8, isPopular: true),
  Food(id: 'f11', name: 'Galouti Kebab', description: 'Soft, delicately spiced kebabs served with mint chutney', category: 'Starters', price: 240, imageUrl: 'https://images.unsplash.com/photo-1529042410759-befb1204b468?w=900', isVeg: false, rating: 4.7),
  Food(id: 'f12', name: 'Chicken 65', description: 'Crispy, spicy fried chicken tossed with curry leaves', category: 'Starters', price: 210, imageUrl: 'https://images.unsplash.com/photo-1603894584373-5ac82b2ae398?w=900', isVeg: false, rating: 4.8, isPopular: true),
  Food(id: 'f13', name: 'Mirchi Bajji', description: 'Hyderabadi green chilli fritters with a crisp gram-flour coating', category: 'Snacks', price: 80, imageUrl: 'https://images.unsplash.com/photo-1601050690597-df0568f70950?w=900', isVeg: true, rating: 4.4),
  Food(id: 'f14', name: 'Hyderabadi Marag', description: 'A delicate, peppery mutton soup with a rich flavour', category: 'Hyderabadi', price: 190, imageUrl: 'https://images.unsplash.com/photo-1547592180-85f173990554?w=900', isVeg: false, rating: 4.6),
  Food(id: 'f15', name: 'Dalcha', description: 'Comforting lentil and vegetable stew with traditional seasoning', category: 'Curries', price: 140, imageUrl: 'https://images.unsplash.com/photo-1547592180-85f173990554?w=900', isVeg: true, rating: 4.5),
  Food(id: 'f16', name: 'Bagara Khana', description: 'Fragrant spiced rice traditionally served with salan', category: 'Rice', price: 160, imageUrl: 'https://images.unsplash.com/photo-1516684732162-798a0062be99?w=900', isVeg: true, rating: 4.6),
  Food(id: 'f17', name: 'Pesarattu', description: 'Andhra-style green gram dosa served with chutney', category: 'Breakfast', price: 100, imageUrl: 'https://images.unsplash.com/photo-1630383249896-424e482df921?w=900', isVeg: true, rating: 4.5),
  Food(id: 'f18', name: 'Irani Chai & Osmania Biscuits', description: 'Classic Hyderabad tea paired with buttery, lightly salted biscuits', category: 'Beverages', price: 90, imageUrl: 'https://images.unsplash.com/photo-1571934811356-5cc061b6821f?w=900', isVeg: true, rating: 4.8, isPopular: true),
  Food(id: 'f19', name: 'Double ka Meetha', description: 'Traditional bread pudding with saffron, nuts and sweet milk', category: 'Desserts', price: 130, imageUrl: 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=900', isVeg: true, rating: 4.7),
  Food(id: 'f20', name: 'Qubani ka Meetha', description: 'Apricot dessert slowly cooked and served with a creamy topping', category: 'Desserts', price: 150, imageUrl: 'https://images.unsplash.com/photo-1488477181946-6428a0291777?w=900', isVeg: true, rating: 4.8),
  Food(id: 'f21', name: 'Sheermal', description: 'Soft, lightly sweet saffron flatbread baked until golden', category: 'Breads', price: 75, imageUrl: 'https://images.unsplash.com/photo-1601050690597-df0568f70950?w=900', isVeg: true, rating: 4.5),
];

const List<String> foodCategories = [
  'All', 'Biryani', 'Hyderabadi', 'Starters', 'Snacks',
  'Curries', 'Rice', 'Breakfast', 'Breads', 'Desserts', 'Beverages',
];
