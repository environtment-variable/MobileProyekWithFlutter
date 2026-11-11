# 📱 Aplikasi Navigasi & Kuliner Nusantara (Flutter)

[![Flutter Version](https://img.shields.io/badge/Flutter-%5E3.13.5-blue?logo=flutter)](https://flutter.dev)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Platform](<https://img.shields.io/badge/Platform-Android%20%7C%20iOS%20%7C%20Web-lightgrey>)](https://flutter.dev)

Aplikasi mobile berbasis Flutter yang dikembangkan untuk memenuhi tugas praktikum Pemrograman Piranti Bergerak mengenai **Navigasi Antar Halaman (Routing)**, yang dimodifikasi menjadi aplikasi katalog makanan interaktif dengan pengiriman data objek kompleks antar halaman.

---

## 🚀 Fitur Utama

- **Navigasi Lengkap & Fleksibel**:
  - Implementasi *Named Routes* (`/`, `/profil`, `/pengaturan`, `/rail`, `/detail`).
  - Navigasi halaman menggunakan `Navigator.pushNamed()` dengan pengiriman objek data dinamis.
- **Daftar Kuliner Menarik (`ListView.builder`)**: Menampilkan daftar makanan lengkap dengan gambar dari internet, nama, harga bertipe `int` (diformat ke Rupiah), serta deskripsi menu.
- **Antarmuka Pengguna Modern (Material 3)**:
  - *Bottom Navigation Bar* untuk perpindahan menu utama (Home, Kategori, Keranjang).
  - *Navigation Drawer* interaktif dengan profil pengguna dan avatar.
  - *Tab Controller* pada halaman utama untuk memisahkan menu makanan dan promo diskon.
  - *NavigationRail Demo* untuk tata letak layar lebar/tablet.

---

## 📂 Struktur Direktori Proyek

```text
aplikasi_navigasi/
├── android/
├── ios/
├── lib/
│   ├── models/
│   │   └── food_model.dart         # Model data makanan & dummy data
│   ├── pages/
│   │   ├── detail_produk_page.dart # Halaman detail menerima objek Food
│   │   ├── kategori_page.dart      # Halaman kategori produk
│   │   ├── keranjang_page.dart     # Halaman keranjang belanja
│   │   ├── home_tab_content.dart   # Konten tab beranda (List Makanan)
│   │   ├── main_page.dart          # Halaman utama (Drawer & BottomNav)
│   │   ├── navigation_rail_page.dart # Demo NavigationRail
│   │   ├── pengaturan_page.dart    # Halaman pengaturan aplikasi
│   │   └── profil_page.dart        # Halaman profil pengguna
│   └── main.dart                   # Titik masuk aplikasi & konfigurasi Routes
├── assets/
│   └── Hehe.jpg                    # Aset foto profil
├── pubspec.yaml                    # Konfigurasi dependensi & aset
└── README.md
```

---

## 🛠️ Cara Menjalankan Proyek

Pastikan Anda sudah menginstal Flutter SDK di komputer Anda.

1. **Clone Repository ini**:
   git clone https://github.com/USERNAME_ANDA/aplikasi_navigasi.git
   cd aplikasi_navigasi
2. **Pilih Branch (jika menggunakan branch `main2`)**:
   git checkout main2
3. **Install Dependencies**:
   flutter pub get
4. **Jalankan Aplikasi**:
   flutter run

---

## 👤 Identitas Pengguna

- **Nama**: Muhammad Rizkya Nasti Firmansyah
- **NPM**: 5520124054
- **Kelas**: IF-B 24
- **Program Studi**: S1 Teknik Informatika
- **Institusi**: Universitas Suryakancana
