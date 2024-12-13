import 'package:flutter/material.dart';

class Image04 extends StatelessWidget {
  const Image04({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menampilkan Gambar dari URL'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildImageCard(
                'https://static.wikia.nocookie.net/naruto/images/3/30/Hokage_Hashirama.png'),
            buildImageCard(
                'https://upload.wikimedia.org/wikipedia/id/b/be/Tobirama_Senju.png'),
            buildImageCard(
                'https://static.promediateknologi.id/crop/0x0:0x0/0x0/webp/photo/p2/113/2023/11/08/Alasan-Utama-Sarutobi-Hiruzen-dibenci-fans-Naruto-3971855199.jpg'),
            buildImageCard(
                'https://cdn.idntimes.com/content-images/community/2021/07/hokage-minato-cropped-56965fbaa68adf470a17cc45ea5d328d-88cca1df70c39740743b65d213c40fcb_600x400.png'),
            buildImageCard(
                'https://assets.pikiran-rakyat.com/crop/0x0:0x0/750x500/photo/2022/10/23/934786489.jpg'),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk membangun kotak gambar
  Widget buildImageCard(String imageUrl) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), // Sudut melengkung
        color: Colors.grey[200], // Warna latar belakang untuk placeholder
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          imageUrl,
          fit: BoxFit.none, // Menampilkan gambar sesuai dimensi aslinya
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        (loadingProgress.expectedTotalBytes ?? 1)
                    : null,
              ),
            );
          },
          errorBuilder:
              (BuildContext context, Object error, StackTrace? stackTrace) {
            return const Center(child: Text('Gagal memuat gambar'));
          },
        ),
      ),
    );
  }
}
