import 'package:baca_buku_app1/api_services.dart';
import 'package:baca_buku_app1/common/color.dart';
import 'package:baca_buku_app1/screen/detail_buku.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Koleksi extends StatefulWidget {
  const Koleksi({super.key});

  @override
  State<Koleksi> createState() => _KoleksiState();
}

class _KoleksiState extends State<Koleksi> {
  bool favorieOff = false;
  late Future _futureData;
  final BookApiService apiService = BookApiService();
  final TextEditingController _searchController = TextEditingController();
  List<dynamic> _filteredBooks = [];

  @override
  void initState() {
    super.initState();
    _futureData = apiService.getBuku();
    favorieOff = true;
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
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        title: Text(
          "Koleksi",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4),
            child: Container(
              color: CustomColor.first,
              height: 4,
            )),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                _filterBooks(value);
              },
              decoration: InputDecoration(
                hintText: "Cari Koleksimu",
                contentPadding: const EdgeInsets.symmetric(vertical: 20),
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    scrollDirection: Axis.vertical,
                    itemCount: books.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Card(
                          color: Colors.white,
                          elevation: 5,
                          child: InkWell(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailBuku(
                                          books: snapshot.data['data'][index])));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Stack(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: mediaQuery.height / 10,
                                        child:
                                            Image.asset(snapshot.data['data'][index]['image']),
                                      ),
                                      SizedBox(width: mediaQuery.height * .02),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            snapshot.data['data'][index]['judul'],
                                            style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700,
                                              fontSize: mediaQuery.width / 20,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 7,
                                          ),
                                          Text(
                                            snapshot.data['data'][index]['pengarang'],
                                            style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: mediaQuery.width / 25,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          favorieOff = !favorieOff;
                                        });
                                      },
                                      splashColor: Colors.transparent,
                                      icon: Icon(favorieOff
                                          ? Icons.favorite
                                          : Icons.favorite_outline),
                                      style: ButtonStyle(
                                        shape: const WidgetStatePropertyAll(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(7),
                                            ),
                                          ),
                                        ),
                                        backgroundColor: WidgetStatePropertyAll(
                                            CustomColor.first),
                                        iconColor: WidgetStatePropertyAll(
                                            CustomColor.second),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ));
                } else {
                  return const Text('No Data');
                }
              }),
              const SizedBox(height: 70)
        ],
      ),
    );
  }
}
