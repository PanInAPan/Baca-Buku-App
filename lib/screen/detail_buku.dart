import 'package:baca_buku_app1/screen/navbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:baca_buku_app1/common/color.dart';
import 'package:readmore/readmore.dart';

class DetailBuku extends StatefulWidget {
  final Map books;

  const DetailBuku({super.key, required this.books});

  @override
  State<DetailBuku> createState() => _DetailBukuState();
}

class _DetailBukuState extends State<DetailBuku> {
  bool favorieOn = false;

  @override
  void initState() {
    super.initState();
    favorieOn = true;
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: ListView(
          padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Navbar()));
                  },
                  icon: const Icon(Icons.arrow_back),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(CustomColor.first),
                    iconColor: WidgetStatePropertyAll(CustomColor.second),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      favorieOn = !favorieOn;
                    });
                  },
                  icon:
                      Icon(favorieOn ? Icons.favorite_border : Icons.favorite),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(CustomColor.first),
                    iconColor: WidgetStatePropertyAll(CustomColor.second),
                  ),
                ),
              ],
            ),
            SizedBox(height: mediaQuery.width * .03),
            Column(
              children: [
                SizedBox(
                  height: mediaQuery.width / 1.2,
                  child: Image.asset(widget.books['image']),
                ),
                Center(
                  child: Text(
                    widget.books['judul'],
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: mediaQuery.width / 19),
                  ),
                ),
                Center(
                  child: Text(
                    widget.books['pengarang'],
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: mediaQuery.width / 24,
                        color: const Color.fromARGB(255, 85, 85, 85)),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 25, 0, 10),
              child: Text(
                "Sinopsis",
                style: GoogleFonts.poppins(
                    fontSize: mediaQuery.width / 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
            ReadMoreText(
              '${widget.books['deskripsi']}\n',
              trimCollapsedText: "Selengkapnya",
              trimExpandedText: "Lebih Sedikit",
              trimMode: TrimMode.Line,
              trimLines: 10,
              moreStyle: GoogleFonts.poppins(
                fontSize: mediaQuery.width / 23,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              lessStyle: GoogleFonts.poppins(
                fontSize: mediaQuery.width / 23,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              style: GoogleFonts.poppins(
                  fontSize: mediaQuery.width / 23,
                  fontWeight: FontWeight.normal,
                  color: const Color.fromARGB(255, 107, 107, 107)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 25, 0, 10),
              child: Text(
                "Detail",
                style: GoogleFonts.poppins(
                    fontSize: mediaQuery.width / 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Stok\n${widget.books['stok']}",
                  maxLines: 2,
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w400),
                ),
                Text("Tahun Terbit\n${widget.books['tahun_terbit']}",
                    maxLines: 2,
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w400)),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text("Kategori\n${widget.books['category']}",
            //         maxLines: 2,
            //         style: GoogleFonts.poppins(fontWeight: FontWeight.w400)),
            //   ],
            // ),
            const SizedBox(
              height: 20,
            )
          ],
        )),
        Container(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          height: mediaQuery.width / 4.5,
          width: mediaQuery.width,
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 7,
              blurRadius: 5,
            )
          ]),
          child: SizedBox(
            height: mediaQuery.width,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Navbar()));
              },
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(CustomColor.first)),
              child: Text(
                "Pinjam Sekarang",
                style: GoogleFonts.poppins(
                    fontSize: mediaQuery.width / 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        )
      ],
    ));
  }
}
