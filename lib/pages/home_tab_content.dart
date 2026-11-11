import 'package:flutter/material.dart';
import '../models/food_model.dart';

class HomeTabContent extends StatelessWidget {
  const HomeTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const TabBar(
            labelColor: Colors.teal,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.teal,
            tabs: [
              Tab(icon: Icon(Icons.restaurant_menu), text: 'Menu Makanan'),
              Tab(icon: Icon(Icons.local_offer), text: 'Promo Diskon'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                // Tab 1: List Makanan
                ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: foodList.length,
                  itemBuilder: (context, index) {
                    final food = foodList[index];
                    return Card(
                      elevation: 3,
                      margin: const EdgeInsets.only(bottom: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(10),
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            food.imageUrl,
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.fastfood, size: 40),
                          ),
                        ),
                        title: Text(
                          food.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          'Rp ${food.price.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
                          style: TextStyle(
                            color: Colors.teal[700],
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                        onTap: () {
                          // Mengirim data objek Food melalui arguments routing
                          Navigator.pushNamed(
                            context,
                            '/detail',
                            arguments: food,
                          );
                        },
                      ),
                    );
                  },
                ),
                // Tab 2: Promo
                const Center(
                  child: Text(
                    '🔥 Diskon Spesial Kuliner Akhir Pekan hingga 50%!',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}