
# Tugas Mobile Programming - Aplikasi Berita Flutter (News API)

Repository ini berisi aplikasi **Aplikasi Berita** berbasis framework **Flutter** yang terhubung dengan **News API** untuk menampilkan artikel berita terkini secara real-time. Aplikasi ini dilengkapi dengan fitur interaktif seperti **Pull-to-Refresh** dan tombol **Kembali ke Atas (Scroll to Top)** untuk meningkatkan pengalaman pengguna (*User Experience*).

## ✨ Fitur Utama Tugas

1. **Pull-to-Refresh (Tarik untuk Memuat Ulang):**

   * Menggunakan widget `RefreshIndicator` untuk memperbarui/mengambil ulang daftar berita terbaru secara instan dari News API tanpa perlu membuka ulang aplikasi.
   * Tetap dapat dijalankan secara lancar bahkan saat kondisi daftar berita kosong atau saat terjadi kesalahan koneksi/network error berkat penerapan `AlwaysScrollableScrollPhysics`.
2. **Tombol Kembali ke Atas (Scroll to Top):**

   * Menggunakan `ScrollController` untuk memantau batas scroll pengguna saat membaca berita.
   * Tombol melayang (`FloatingActionButton` dengan ikon panah atas) akan muncul secara otomatis saat posisi scroll pengguna telah melebihi threshold 300 piksel ke bawah.
   * Ketika tombol diklik, aplikasi melakukan scroll animasi halus (*smooth scroll*) kembali ke posisi teratas (`offset: 0`).
3. **Integrasi REST API (News API):**

   * Menggunakan package `http` untuk mengirim permintaan data (*HTTP GET*) secara asinkron ke server News API.
   * Pemodelan data yang terstruktur menggunakan kelas `Article` yang dilengkapi fungsi `factory Article.fromJson` untuk melakukan parsing data JSON dengan aman (*null-safety*).

---

## 📁 Informasi File Proyek

- **`lib/main.dart`** : Entry point utama aplikasi yang menginisialisasi `MaterialApp` serta mengelola tampilan UI berita, alur state `FutureBuilder`, integrasi `RefreshIndicator`, dan logika `ScrollController`.
- **`lib/api_service.dart`** : Berisi layanan `ApiService` yang mengurusi komunikasi jaringan dan pengambilan data berita dari endpoint REST API.
- **`lib/article_model.dart`** : Model data `Article` yang memetakan properti berita seperti judul (`title`), deskripsi (`description`), dan URL gambar (`urlToImage`).

---

## 🛠️ Cara Menjalankan Aplikasi

Pastikan SDK Flutter Anda sudah terinstal dengan baik di perangkat lokal.

1. Jalankan perintah unduh dependensi:
   ```bash
   flutter pub get
   ```
2. Jalankan aplikasi pada perangkat target Anda:
   * **Android / Emulator:**
     ```bash
     flutter run
     ```
   * **Linux Desktop Native:**
     ```bash
     flutter run -d linux
     ```
   * **Web Browser (Chrome/Brave via HTML Renderer):**
     ```bash
     flutter run -d chrome --dart-define=FLUTTER_WEB_RENDERER=html
     ```

---

## 🔗 Link Repository GitHub

- **URL Repository:** [MobileProyekWithFlutter](https://github.com/environtment-variable/MobileProyekWithFlutter.git)
- **Branch Utama Tugas:** `main1`
