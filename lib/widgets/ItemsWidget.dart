import 'package:flutter/material.dart';

class ItemsWidget extends StatelessWidget {
  ItemsWidget({super.key});

  final List<String> myProductName = [
    'Bumi - Tereliye',
    'Bulan - Tereliye',
    'Bintang - Tereliye',
    'Matahari - Tereliye',
    'Rumah - J.S Khairen',
    'Bungkam Suara - J.S Khairen',
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 1.0,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
        for (int i = 0; i < myProductName.length; i++)
          Container(
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
              top: 8,
              bottom: 8,
            ),
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header - Diskon dan Ikon Favorit
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 42, 42, 45),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        '-50%',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Icon(Icons.favorite_border, color: Colors.red),
                  ],
                ),

                // Gambar Produk dan Navigasi
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "itemsPage");
                  },
                  child: Center(
                    child: Image.asset(
                      'images/${i + 1}.jpg',
                      height: 90,
                      width: 90,
                    ),
                  ),
                ),

                // Nama Produk
                Container(
                  padding: const EdgeInsets.only(bottom: 4),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    myProductName[i],
                    style: const TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 42, 42, 45),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // Deskripsi Produk
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Adalah salah satu buku dari seri BUMI yang ditulis oleh penulis terkenal di Indonesia yaitu Tere Liye.',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12,
                      color: Color.fromARGB(255, 42, 42, 45),
                    ),
                  ),
                ),
                SizedBox(height: 5),

                // Harga dan Ikon Keranjang
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$65',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 42, 42, 45),
                        ),
                      ),
                      Icon(
                        Icons.shopping_cart,
                        size: 20,
                        color: Color.fromARGB(255, 42, 42, 45),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
