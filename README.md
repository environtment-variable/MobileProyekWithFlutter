
# Tugas Mobile Programming - Kalkulator BMI Estetis (Standar Kemenkes RI)

Repository ini berisi aplikasi **Kalkulator BMI (Body Mass Index)** atau Indeks Massa Tubuh (IMT) berbasis framework **Flutter**. Aplikasi ini didesain khusus menggunakan tema warna **Cyan Tua / Teal** yang menarik serta mengadopsi standarisasi klasifikasi kesehatan dari **Kementerian Kesehatan RI (Kemenkes)** untuk populasi Asia/Indonesia.

## ✨ Fitur Utama Tugas

1. **Tombol "Reset" (Sesuai Soal 1):**

   * Menyediakan tombol aksi `Reset` di sebelah tombol `Hitung`.
   * Berfungsi untuk mengosongkan seluruh isi kotak input (`TextField` Tinggi & Berat Badan), mengembalikan pilihan gender ke default, serta menyembunyikan/menghilangkan visual kartu hasil perhitungan dari layar secara instan.
2. **Tampilan Menarik & Estetis (Sesuai Soal 2):**

   * Menggunakan basis palet warna kustom **Teal Pekat / Cyan Tua** (`0xFF004D40` & `0xFF00695C`) yang memberikan kesan modern, bersih, dan sejuk di mata.
   * Dilengkapi komponen visual interaktif seperti `Card` yang melayang (*elevation*), pemanfaatan ikon representatif pada input, serta tata letak responsif menggunakan `SingleChildScrollView`.
3. **Disparitas Hasil Gender Laki-Laki & Perempuan (Sesuai Soal 3):**

   * Mengelompokkan dan memisahkan logika perhitungan ambang batas (*cutoff points*) kesehatan secara spesifik antara Laki-laki dan Perempuan.
   * Penentuan rentang mengacu pada fakta medis sensitivitas komposisi lemak viseral biologis serta regulasi hormonal pada tubuh wanita dewasa.

---

## 📊 Batas Ambang Klasifikasi BMI (Standar Asia-Pasifik / Kemenkes RI)

Aplikasi ini menggunakan pengondisian medis yang akurat untuk menentukan kategori kesehatan pengguna:

### ♂️ Logika Laki-laki

* **Kurus (Kekurangan Berat Badan):** BMI < 18.5
* **Normal (Ideal Laki-laki):** BMI 18.5 – 22.9
* **Kelebihan Berat Badan (Overweight):** BMI 23.0 – 24.9
* **Obesitas Tingkat I:** BMI 25.0 – 29.9
* **Obesitas Tingkat II:** BMI ≥ 30.0

### ♀️ Logika Perempuan

* **Kurus (Kekurangan Berat Badan):** BMI < 18.0
* **Normal (Ideal Perempuan):** BMI 18.0 – 21.9
* **Kelebihan Berat Badan (Overweight):** BMI 22.0 – 24.9
* **Obesitas Tingkat I:** BMI 25.0 – 29.9
* **Obesitas Tingkat II:** BMI ≥ 30.0

---

## 📁 Informasi File Proyek

* **`lib/main.dart`** : Titik masuk (*entry point*) yang memanggil halaman kalkulator utama.
* **`lib/kalkulatorBMI.dart`** : Berisi arsitektur stateful widget, kontroler teks (`TextEditingController`), komponen layout UI, logika matematika rumus BMI, dan fungsi reset form.

## 🛠️ Cara Menjalankan Aplikasi

Pastikan SDK Flutter Anda sudah terinstal dengan baik di perangkat lokal.

1. Jalankan perintah unduh dependensi:
   ```bash
   flutter pub get
   ```
2. Jalankan aplikasi pada perangkat target Anda:
   * **Linux Desktop Native:**
     ```bash
     flutter run -d linux
     ```
   * **Web Browser (Chrome/Brave via HTML Renderer):**
     ```bash
     flutter run -d chrome --dart-define=FLUTTER_WEB_RENDERER=html
     ```
