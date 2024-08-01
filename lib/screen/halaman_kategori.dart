import 'package:baca_buku_app1/api_services.dart';
import 'package:baca_buku_app1/common/color.dart';
import 'package:baca_buku_app1/screen/detail_buku.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HalamanKategori extends StatefulWidget {
  final List<dynamic> books;
  const HalamanKategori({super.key, required this.books});

  @override
  State<HalamanKategori> createState() => _HalamanKategoriState();
}

class _HalamanKategoriState extends State<HalamanKategori> {
  late Future _futureData;
  final BookApiService apiService = BookApiService();
  final TextEditingController _searchController = TextEditingController();
  List<dynamic> _filteredBooks = [];

  @override
  void initState() {
    super.initState();
    _futureData = apiService.getBuku();
  }

  void _filterBooks(String query) {
    setState(() {
      _futureData.then((books) {
        _filteredBooks = books.where((book) {
          final titleLower = book['title'].toLowerCase();
          final authorLower = book['author'].toLowerCase();
          final searchLower = query.toLowerCase();
          return titleLower.contains(searchLower) ||
              authorLower.contains(searchLower);
        }).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: CustomColor.first),
        toolbarHeight: 80,
        title: TextField(
          controller: _searchController,
          onChanged: _filterBooks,
          decoration: InputDecoration(
            hintText: "Cari buku",
            prefixIcon: Icon(Icons.search, color: CustomColor.first),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: CustomColor.first, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: CustomColor.first, width: 3),
            ),
          ),
        ),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4),
            child: Container(
              color: CustomColor.first,
              height: 4,
            )),
      ),
      body: Center(
        child: FutureBuilder(
            future: _futureData,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator(
                  color: Colors.blue,
                );
              } else if (snapshot.hasError) {
                return Text('Error : ${snapshot.error}');
              } else if (snapshot.hasData) {
                final books = _searchController.text.isEmpty
                      ? snapshot.data!
                      : _filteredBooks;
                return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, mainAxisSpacing: 50),
                    scrollDirection: Axis.vertical,
                    itemCount: books.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailBuku(
                                        books: snapshot.data!,
                                      )));
                        },
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                            color: Colors.transparent,
                            width: mediaQuery.width / 2.9,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: mediaQuery.width / 3.5,
                                  child: Image.network(
                                    snapshot.data![index]['image'],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  snapshot.data![index]['title'],
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w900,
                                      fontSize: mediaQuery.width / 24),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  snapshot.data![index]['author'],
                                  style: GoogleFonts.poppins(
                                      color:
                                          const Color.fromARGB(255, 102, 102, 102),
                                      fontWeight: FontWeight.w600,
                                      fontSize: mediaQuery.width / 26),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              } else {
                return const Text('No Data');
              }
            }),
      ),
    );
  }
}
