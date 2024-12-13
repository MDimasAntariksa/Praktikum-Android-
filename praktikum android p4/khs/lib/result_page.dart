import 'package:flutter/material.dart';
import 'konversi.dart';

class ResultPage extends StatelessWidget {
  final List<String> grades;

  const ResultPage({Key? key, required this.grades}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final konversi = Konversi();
    double totalSks = 0;
    double totalNilai = 0;
    const double maxSks = 23; // Batas maksimal SKS

    for (var grade in grades) {
      final sks = konversi.sksMatkul(grade);

      // Cek apakah total SKS masih di bawah batas maksimal
      if (totalSks + sks <= maxSks) {
        totalSks += sks;
        totalNilai += sks * konversi.gradeToPoint(grade);
      } else {
        break; // Hentikan penambahan jika SKS melebihi batas
      }
    }

    final ipk = totalSks > 0 ? totalNilai / totalSks : 0.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Hasil Perhitungan"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Jumlah SKS: $totalSks"),
            Text("IPK: ${ipk.toStringAsFixed(2)}"),
            Text("Prestasi: ${konversi.indeksPrestrasiSemester(ipk)}"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context); // Kembali ke halaman input
        },
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
