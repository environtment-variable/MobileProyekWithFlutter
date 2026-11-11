import 'package:flutter/material.dart';
import 'pages/main_page.dart';
import 'pages/profil_page.dart';
import 'pages/pengaturan_page.dart';
import 'pages/detail_produk_page.dart';
import 'pages/navigation_rail_page.dart';

void main() {
  runApp(const TokoKitaUltimateApp());
}

class TokoKitaUltimateApp extends StatelessWidget {
  const TokoKitaUltimateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TokoSuper Ultimate Navigation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainPage(),
        '/profil': (context) => const ProfilPage(),
        '/pengaturan': (context) => const PengaturanPage(),
        '/detail': (context) => const DetailProdukPage(),
        '/rail': (context) => const NavigationRailDemoPage(),
      },
    );
  }
}