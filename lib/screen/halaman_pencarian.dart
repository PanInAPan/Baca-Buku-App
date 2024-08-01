import 'package:baca_buku_app1/api_services.dart';
import 'package:baca_buku_app1/common/color.dart';
import 'package:baca_buku_app1/screen/detail_buku.dart';
import 'package:baca_buku_app1/screen/navbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HalamanPencarian extends StatefulWidget {
  const HalamanPencarian({super.key});

  @override
  State<HalamanPencarian> createState() => _HalamanPencarianState();
}

class _HalamanPencarianState extends State<HalamanPencarian> {
  late Future _futureData;
  final BookApiService apiService = BookApiService();
  final TextEditingController _searchController = TextEditingController();
  List<dynamic> _filteredBooks = [];

  @override
  void initState() {
    super.initState();
    _futureData = apiService.getBuku();
  }

  void _filterBooks(String query) async {
    final books = (await _futureData)['data'];
    if (query.isEmpty) {
      setState(() {
        _filteredBooks = books;
      });
    } else {
      setState(() {
        _filteredBooks = books.where((book) {
          final titleLower = book['judul'].toLowerCase();
          final authorLower = book['pengarang'].toLowerCase();
          final searchLower = query.toLowerCase();

          return titleLower.contains(searchLower) || authorLower.contains(searchLower);
        }).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                _filterBooks(value);
              },
              decoration: InputDecoration(
                hintText: "Cari Buku",
                contentPadding: const EdgeInsets.symmetric(vertical: 20),
                prefixIcon: Icon(Icons.search, color: CustomColor.first),
                suffixIcon: IconButton(
                  onPressed: () {
                    _searchController.clear();
                    _filterBooks('');
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Navbar()));
                  },
                  icon: const Icon(Icons.cancel_outlined),
                ),
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
          ),
          FutureBuilder(
            future: _futureData,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator(
                  color: Colors.blue,
                );
              } else if (snapshot.hasError) {
                return Text('Error : ${snapshot.error}');
              } else if (snapshot.hasData) {
                final books = _searchController.text.isEmpty ? snapshot.data['data'] : _filteredBooks;
                return Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    itemCount: books.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: ListTile(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailBuku(books: books[index]),
                              ),
                            );
                          },
                          leading: Image.asset(books[index]['image']),
                          title: Text(
                            books[index]['judul'],
                            style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(books[index]['pengarang']),
                        ),
                      );
                    },
                  ),
                );
              } else {
                return const Text('No Data');
              }
            },
          ),
        ],
      ),
    );
  }
}
