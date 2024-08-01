import 'package:baca_buku_app1/common/color.dart';
import 'package:baca_buku_app1/screen/halaman_kategori.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryItems extends StatelessWidget {
  final List<dynamic> books;
  final List<dynamic> categories;

  const CategoryItems({
    super.key,
    required this.books,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisSpacing: 30),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => HalamanKategori(books: [],)));
          },
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Container(
            alignment: Alignment.center,
            width: mediaQuery.height / 7,
            decoration: const BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Column(
              children: [
                Container(
                  height: mediaQuery.width / 5,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: CustomColor.first,
                  ),
                  child: Icon(Icons.abc, size: mediaQuery.width / 8),
                ),
                Text(
                  categories[index]['name'],
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: mediaQuery.width / 24),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
