
# Tugas Mobile Programming - Flutter Profil Card

Tugas ini merupakan aplikasi mobile sederhana berbasis framework **Flutter** yang menampilkan kartu identitas profil mahasiswa beserta dua `Card` tambahan untuk alamat media sosial.

## 🧑‍💻 Biodata Mahasiswa

* **Nama:** Muhammad Rizkya Nasti Firmansyah
* **NPM:** 552-01-24-054
* **Program Studi:** Teknik Informatika

## 🚀 Fitur Aplikasi

* **Avatar Profil:** Menampilkan komponen avatar lingkaran (`CircleAvatar`).
* **Informasi Utama:** Nama lengkap dan Nomor Pokok Mahasiswa (NPM).
* **Card Media Sosial:** Dua buah komponen `Card` responsif yang memuat tautan media sosial:
  * GitHub (`://github.com`)
  * Instagram
* **Desain Tema:** Menggunakan basis warna kustom **Cyan Tua / Teal Pekat** (`0xFF004D40`) dengan teks putih yang kontras dan bersih.

## 📁 Struktur File Utama

```text
aplikasi_pertama/
├── lib/
│   ├── main.dart        # Entry point utama aplikasi Flutter
│   └── kartunama.dart   # Komponen tata letak halaman profil dan card
└── README.md            # Dokumentasi proyek tugas
```

## 🛠️ Cara Menjalankan Proyek secara Lokal

1. **Clone Repository:**
   ```bash
   git clone https://://github.com/aplikasi_pertama.git
   ```
2. **Masuk ke Direktori Proyek:**
   ```bash
   cd aplikasi_pertama
   ```
3. **Ambil Dependensi Proyek:**
   ```bash
   flutter pub get
   ```
4. **Jalankan Aplikasi:**
   * Untuk Desktop Linux:
     ```bash
     flutter run -d linux
     ```
   * Untuk Web Browser (HTML Renderer):
     ```bash
     flutter run -d chrome --dart-define=FLUTTER_WEB_RENDERER=html
     ```

## ❗❗ Untuk Projek App BMI Di Tree Main0
## ❗❗ Untuk Projek App Berita Di Tree Main1
