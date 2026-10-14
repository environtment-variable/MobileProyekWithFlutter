import 'package:flutter/material.dart';

class KartuNama extends StatelessWidget {
  const KartuNama({super.key});

  @override
  Widget build(BuildContext context) {
    
    const Color warnaCyanTua = Color(0xFF004D40); 

    return Scaffold(
      backgroundColor: warnaCyanTua, 
      appBar: AppBar(
        title: const Text(
          'Profil & Media Sosial',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF00695C),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            
            // Avatar Lingkaran
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person,
                size: 60,
                color: warnaCyanTua,
              ),
            ),
            const SizedBox(height: 15),

            const Text(
              'Muhammad Rizkya Nasti Firmansyah',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const Text(
              'NPM: 552-01-24-054',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 30),
  
            // DUA CARD ALAMAT MEDIA SOSIAL

            Card(
              color: const Color(0xFF00695C), 
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: const Icon(Icons.code, color: Colors.white),
                title: const Text(
                  'GitHub',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  'github.com/environtment-variable',
                  style: TextStyle(color: Colors.white70),
                ),
                onTap: () {},
              ),
            ),

            Card(
              color: const Color(0xFF00695C), 
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: const Icon(Icons.camera_alt, color: Colors.white),
                title: const Text(
                  'Instagram',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  '@muhammad_rizkya_n_f',
                  style: TextStyle(color: Colors.white70),
                ),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
