import 'package:flutter/material.dart';

class KalkulatorBMI extends StatefulWidget {
  const KalkulatorBMI({super.key});

  @override
  State<KalkulatorBMI> createState() => _KalkulatorBMIState();
}

class _KalkulatorBMIState extends State<KalkulatorBMI> {
  // Properti Input Controller
  final TextEditingController _tinggiController = TextEditingController();
  final TextEditingController _beratController = TextEditingController();

  // Properti Status
  String _jenisKelamin = 'Laki-laki'; // Ambil laki-laki untuk default
  double? _hasilBMI;
  String _kategoriBMI = '';
  String _keteranganKesehatan = '';

  // Properti Tema Warna Cyan Tua
  final Color _warnaCyanTua = const Color(0xFF004D40);
  final Color _warnaTealTerang = const Color(0xFF00695C);

  // FUNGSI HITUNG BMI (Berdasarkan Standar Resmi Kemenkes RI / Asia-Pasifik)
  void _hitungBMI() {
    final double? tinggi = double.tryParse(_tinggiController.text);
    final double? berat = double.tryParse(_beratController.text);

    if (tinggi == null || berat == null || tinggi <= 0 || berat <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Mohon masukkan nilai tinggi dan berat yang valid!')),
      );
      return;
    }

    // Rumus BMI: Berat (kg) / (Tinggi (m) ^ 2)
    final double tinggiMeter = tinggi / 100;
    final double bmi = berat / (tinggiMeter * tinggiMeter);

    setState(() {
      _hasilBMI = bmi;
      
      // Klasifikasi BMI Berdasarkan Standar Kemenkes RI
      if (_jenisKelamin == 'Laki-laki') {
        if (bmi < 18.5) {
          _kategoriBMI = 'Kurus (Kekurangan Berat Badan)';
          _keteranganKesehatan = 'Disarankan untuk meningkatkan asupan makanan tinggi protein dan nutrisi seimbang.';
        } else if (bmi >= 18.5 && bmi <= 22.9) {
          _kategoriBMI = 'Normal (Ideal Laki-laki)';
          _keteranganKesehatan = 'Sangat bagus! Pertahankan pola makan sehat dan aktivitas fisik rutin Anda.';
        } else if (bmi >= 23.0 && bmi <= 24.9) {
          _kategoriBMI = 'Kelebihan Berat Badan (Overweight)';
          _keteranganKesehatan = 'Waspada, kurangi konsumsi makanan berminyak dan mulailah berolahraga secara teratur.';
        } else if (bmi >= 25.0 && bmi <= 29.9) {
          _kategoriBMI = 'Obesitas Tingkat I';
          _keteranganKesehatan = 'Disarankan untuk melakukan defisit kalori ringan dan membatasi porsi makan.';
        } else {
          _kategoriBMI = 'Obesitas Tingkat II';
          _keteranganKesehatan = 'Disarankan untuk berkonsultasi dengan dokter atau ahli gizi demi kesehatan Anda.';
        }
      } else {
        // Klasifikasi Khusus Perempuan (Rentang lebih sensitif terhadap penumpukan lemak viseral)
        if (bmi < 18.0) {
          _kategoriBMI = 'Kurus (Kekurangan Berat Badan)';
          _keteranganKesehatan = 'Perlu menambah porsi makan sehat untuk menjaga keseimbangan siklus hormon tubuh.';
        } else if (bmi >= 18.0 && bmi <= 21.9) {
          _kategoriBMI = 'Normal (Ideal Perempuan)';
          _keteranganKesehatan = 'Kondisi tubuh Anda sangat ideal dan prima! Tetap jaga pola hidup sehat ini.';
        } else if (bmi >= 22.0 && bmi <= 24.9) {
          _kategoriBMI = 'Kelebihan Berat Badan (Overweight)';
          _keteranganKesehatan = 'Batasi konsumsi makanan/minuman manis dan tingkatkan aktivitas kardio.';
        } else if (bmi >= 25.0 && bmi <= 29.9) {
          _kategoriBMI = 'Obesitas Tingkat I';
          _keteranganKesehatan = 'Fokus pada olahraga pembakaran lemak dan kelola stres dengan baik.';
        } else {
          _kategoriBMI = 'Obesitas Tingkat II';
          _keteranganKesehatan = 'Sangat disarankan mengatur pola makan secara ketat dan konsultasi medis.';
        }
      }
    });
  }

  // FUNGSI RESET (Untuk mengosongkan TextField & Menghilangkan Hasil)
  void _resetForm() {
    setState(() {
      _tinggiController.clear();
      _beratController.clear();
      _jenisKelamin = 'Laki-laki';
      _hasilBMI = null;
      _kategoriBMI = '';
      _keteranganKesehatan = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _warnaCyanTua,
      appBar: AppBar(
        title: const Text('Kalkulator BMI Estetis', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: _warnaTealTerang,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Card Desain Form Input
            Card(
              color: _warnaTealTerang,
              elevation: 8,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // Pilihan Jenis Kelamin
                    const Text(
                      'Pilih Jenis Kelamin:',
                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Radio<String>(
                          value: 'Laki-laki',
                          groupValue: _jenisKelamin,
                          activeColor: Colors.cyanAccent,
                          onChanged: (value) => setState(() => _jenisKelamin = value!),
                        ),
                        const Text('Laki-laki', style: TextStyle(color: Colors.white)),
                        const SizedBox(width: 20),
                        Radio<String>(
                          value: 'Perempuan',
                          groupValue: _jenisKelamin,
                          activeColor: Colors.cyanAccent,
                          onChanged: (value) => setState(() => _jenisKelamin = value!),
                        ),
                        const Text('Perempuan', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    const Divider(color: Colors.white30, height: 25),
                    
                    // Input Tinggi Badan
                    TextField(
                      controller: _tinggiController,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        labelText: 'Tinggi Badan (cm)',
                        labelStyle: TextStyle(color: Colors.white70),
                        prefixIcon: Icon(Icons.height, color: Colors.white),
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white54)),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.cyanAccent)),
                      ),
                    ),
                    const SizedBox(height: 15),

                    // Input Berat Badan
                    TextField(
                      controller: _beratController,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        labelText: 'Berat Badan (kg)',
                        labelStyle: TextStyle(color: Colors.white70),
                        prefixIcon: Icon(Icons.scale, color: Colors.white),
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white54)),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.cyanAccent)),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),
            // Tombol Aksi (Hitung & Reset)
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _hitungBMI,
                    icon: const Icon(Icons.calculate, color: Color(0xFF004D40)),
                    label: const Text('Hitung', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF004D40))),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyanAccent,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                // TOMBOL RESET
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _resetForm,
                    icon: const Icon(Icons.refresh, color: Colors.white),
                    label: const Text('Reset', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.white, width: 2),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
              ],
            ),
                        const SizedBox(height: 25),

            // Kondisi tampilan hasil (Hanya muncul jika sudah dihitung / _hasilBMI tidak null)
            if (_hasilBMI != null)
              Card(
                color: Colors.white,
                elevation: 6,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        'HASIL PERHITUNGAN (${_jenisKelamin.toUpperCase()})',
                        style: TextStyle(
                          color: _warnaCyanTua, 
                          fontWeight: FontWeight.bold, 
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        _hasilBMI!.toStringAsFixed(1),
                        style: TextStyle(
                          fontSize: 54, 
                          fontWeight: FontWeight.bold, 
                          color: _warnaCyanTua,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        _kategoriBMI,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18, 
                          fontWeight: FontWeight.bold, 
                          color: Colors.deepOrange,
                        ),
                      ),
                      const Divider(height: 30, thickness: 1),
                      Text(
                        _keteranganKesehatan,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 14, 
                          color: Colors.black87, 
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
