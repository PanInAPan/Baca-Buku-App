import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:baca_buku_app1/api_services.dart';
import 'package:baca_buku_app1/common/color.dart';
import 'package:baca_buku_app1/screen/detail_buku.dart';
import 'package:baca_buku_app1/screen/halaman_pencarian.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Beranda extends StatefulWidget {
  const Beranda({Key? key}) : super(key: key);

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  late Future _futureData;
  final BookApiService apiService = BookApiService();

  @override
  void initState() {
    super.initState();
    _futureData = apiService.getBuku();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: CustomColor.first, size: 30),
        toolbarHeight: 75,
        title: Text(
          "Beranda",
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
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HalamanPencarian()));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                height: mediaQuery.width / 2,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: AnotherCarousel(
                    borderRadius: true,
                    dotBgColor: Colors.transparent,
                    dotSize: 5,
                    dotPosition: DotPosition.bottomLeft,
                    dotColor: const Color.fromARGB(255, 190, 190, 190),
                    images: const [
                      AssetImage("assets/book.jpg"),
                      AssetImage("assets/RickWallpaper.jpg"),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: Text(
                "Rekomendasi Hari Ini",
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: mediaQuery.width / 24),
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
                    return SizedBox(
                        height: mediaQuery.width / 1.5,
                        child: ListView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data['data'].length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailBuku(
                                                books: snapshot.data['data'][index],
                                              )));
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  color: Colors.transparent,
                                  height: mediaQuery.width / 1.5,
                                  width: mediaQuery.width / 2.9,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: mediaQuery.width / 2,
                                        child: Image.asset(snapshot
                                            .data['data'][index]['image']),
                                      ),
                                      Text(
                                        overflow: TextOverflow.ellipsis,
                                        snapshot.data['data'][index]['judul'],
                                        style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w900,
                                            fontSize: mediaQuery.width / 24),
                                      ),
                                      Text(
                                        snapshot.data['data'][index]
                                            ['pengarang'],
                                        style: GoogleFonts.poppins(
                                            color: const Color.fromARGB(
                                                255, 102, 102, 102),
                                            fontWeight: FontWeight.w600,
                                            fontSize: mediaQuery.width / 26),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }));
                  } else {
                    return const Text('No Data');
                  }
                }),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: Text(
                "Buku Terpopuler 2024",
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: mediaQuery.width / 24),
              ),
            ),
            FutureBuilder(
                future: _futureData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator(color: Colors.blue,);
                  } else if (snapshot.hasError) {
                    return Text('Error : ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    return SizedBox(
                        height: mediaQuery.width / 1.5,
                        child: ListView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data['data'].length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailBuku(
                                                books: snapshot.data['data'][index],
                                              )));
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  color: Colors.transparent,
                                  height: mediaQuery.width / 1.5,
                                  width: mediaQuery.width / 2.9,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: mediaQuery.width / 2,
                                        child: Image.asset(snapshot
                                            .data['data'][index]['image']),
                                      ),
                                      Text(
                                        overflow: TextOverflow.ellipsis,
                                        snapshot.data['data'][index]['judul'],
                                        style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w900,
                                            fontSize: mediaQuery.width / 24),
                                      ),
                                      Text(
                                        snapshot.data['data'][index]
                                            ['pengarang'],
                                        style: GoogleFonts.poppins(
                                            color: const Color.fromARGB(
                                                255, 102, 102, 102),
                                            fontWeight: FontWeight.w600,
                                            fontSize: mediaQuery.width / 26),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }));
                  } else {
                    return const Text('No Data');
                  }
                }),
            SizedBox(
              height: mediaQuery.width / 5,
            )
          ],
        ),
      ),
    );
  }
}
