class Food {
  final String name;
  final int price;
  final String description;
  final String imageUrl;

  Food({
    required this.name,
    required this.price,
    required this.description,
    required this.imageUrl,
  });
}

// Dummy List Makanan
final List<Food> foodList = [
  Food(
    name: 'Nasi Goreng Spesial',
    price: 25000,
    description: 'Nasi goreng lezat dengan bumbu rempah pilihan, telur ceplok, suwiran ayam, dan kerupuk.',
    imageUrl: 'https://images.unsplash.com/photo-1603133872878-684f208fb84b?q=80&w=800',
  ),
  Food(
    name: 'Sate Ayam Madura',
    price: 30000,
    description: '10 tusuk sate ayam empuk dengan bumbu kacang gurih khas Madura dan taburan bawang goreng.',
    imageUrl: 'https://images.unsplash.com/photo-1529563021893-cc83c992d75d?q=80&w=800',
  ),
  Food(
    name: 'Ramen Shoyu Kuah Kaldu',
    price: 42000,
    description: 'Mie jepang kenyal dengan kuah kaldu shoyu hangat, chashu daging sapi, dan telur ajitsuke tamago.',
    imageUrl: 'https://images.unsplash.com/photo-1569718212165-3a8278d5f624?q=80&w=800',
  ),
  Food(
    name: 'Burger Beef Deluxe',
    price: 38000,
    description: 'Burger dengan daging sapi juicy, keju leleh, selada segar, tomat, dan saus spesial.',
    imageUrl: 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?q=80&w=800',
  ),
];