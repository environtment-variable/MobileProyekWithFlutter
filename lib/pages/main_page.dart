import 'package:flutter/material.dart';
import 'home_tab_content.dart';
import 'kategori_page.dart';
import 'keranjang_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeTabContent(),
    const KategoriPage(), 
    const KeranjangPage(), 
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TokoSuper'),
        backgroundColor: Colors.teal.shade100,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text('Muhammad Rizkya Nasti Firmansyah'),
              accountEmail: const Text('rizkyanfkan@gmail.com'),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage('assets/Hehe.jpg'),
              ),
              decoration: BoxDecoration(color: Colors.teal),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Halaman Profil'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/profil');
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Halaman Pengaturan'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/pengaturan');
              },
            ),
            ListTile(
              leading: const Icon(Icons.view_sidebar),
              title: const Text('Demo NavigationRail'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/rail');
              },
            ),
          ],
        ),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.category_outlined),
            selectedIcon: Icon(Icons.category),
            label: 'Kategori',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart_outlined),
            selectedIcon: Icon(Icons.shopping_cart),
            label: 'Keranjang',
          ),
        ],
      ),
    );
  }
}