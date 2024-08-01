import 'package:baca_buku_app1/screen/detail_buku.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Borrowed Book List
class BorrowedBookList extends StatelessWidget {
  final List<dynamic> booksOnBorrow;

  const BorrowedBookList({super.key, required this.booksOnBorrow});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: booksOnBorrow.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: Card(
            color: Colors.white,
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Stack(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: mediaQuery.height / 10,
                        child: Image.asset(booksOnBorrow[index]['image']),
                      ),
                      SizedBox(width: mediaQuery.height * .02),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            booksOnBorrow[index]['title'],
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: mediaQuery.width / 25,
                            ),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Text(
                            "Tanggal Peminjaman :",
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: mediaQuery.width / 30,
                            ),
                          ),
                          Text(
                            booksOnBorrow[index]['borrowDate'],
                            style: GoogleFonts.poppins(
                              color: const Color.fromARGB(255, 100, 100, 100),
                              fontWeight: FontWeight.w500,
                              fontSize: mediaQuery.width / 30,
                            ),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Text(
                            "Tanggal Pengembalian :",
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: mediaQuery.width / 30,
                            ),
                          ),
                          Text(
                            booksOnBorrow[index]['returnDate'],
                            style: GoogleFonts.poppins(
                              color: const Color.fromARGB(255, 100, 100, 100),
                              fontWeight: FontWeight.w500,
                              fontSize: mediaQuery.width / 30,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// Returned Book List
class ReturnedBookList extends StatefulWidget {
  final List<dynamic> booksOnReturn;
  final List<dynamic> books;

  const ReturnedBookList(
      {super.key, required this.booksOnReturn, required this.books});

  @override
  State<ReturnedBookList> createState() => _ReturnedBookListState();
}

class _ReturnedBookListState extends State<ReturnedBookList> {
  final items = ["Review 1", "Review 2", "Review 3", "Review 4", "Review 5"];
  String? value;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: widget.booksOnReturn.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Card(
              color: Colors.white,
              elevation: 5,
              child: InkWell(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) =>
                  //             DetailBuku(books: widget.books,)));
                },
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Stack(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: mediaQuery.height / 10,
                            child: Image.asset(
                                widget.booksOnReturn[index]['image']),
                          ),
                          SizedBox(width: mediaQuery.height * .02),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.booksOnReturn[index]['title'],
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: mediaQuery.width / 25,
                                ),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              Text(
                                "Tanggal Pengembalian :",
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: mediaQuery.width / 30,
                                ),
                              ),
                              Text(
                                widget.booksOnReturn[index]['returnDate'],
                                style: GoogleFonts.poppins(
                                  color:
                                      const Color.fromARGB(255, 100, 100, 100),
                                  fontWeight: FontWeight.w500,
                                  fontSize: mediaQuery.width / 30,
                                ),
                              ),
                              SizedBox(
                                height: mediaQuery.width / 8,
                              ),
                              // Row(
                              //   children: [
                              //     SizedBox(
                              //       height: mediaQuery.width / 15,
                              //       width: mediaQuery.width / 4,
                              //       child: TextButton(
                              //         onPressed: (){
                              //           openDialog();
                              //         },
                              //         style: ButtonStyle(
                              //           backgroundColor: WidgetStatePropertyAll(CustomColor.first),
                              //           shape: const WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))))
                              //         ),
                              //         child: Text(
                              //           "Berikan Ulasan",
                              //           style: GoogleFonts.poppins(
                              //             color: Colors.white,
                              //             fontWeight: FontWeight.bold,
                              //             fontSize: mediaQuery.width / 45,
                              //           ),
                              //         ),
                              //       ),
                              //     ),
                              //     const SizedBox(width: 10,),
                              //     Container(
                              //       padding: EdgeInsets.only(left: 7),
                              //       decoration: BoxDecoration(
                              //         color: CustomColor.first,
                              //         borderRadius: const BorderRadius.all(Radius.circular(5))
                              //       ),
                              //       height: mediaQuery.width / 15,
                              //       width: mediaQuery.width / 4,
                              //       child: DropdownButtonHideUnderline(
                              //         child: DropdownButton<String>(
                              //           hint: Text(
                              //           "Berikan Rating",
                              //           style: GoogleFonts.poppins(
                              //             color: Colors.white,
                              //             fontWeight: FontWeight.bold,
                              //             fontSize: mediaQuery.width / 45,
                              //           ),
                              //         ),
                              //           isExpanded: true,
                              //           icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                              //           iconSize: 20,
                              //           items: items.map(buildMenuItem).toList(),
                              //           onChanged: (value) => setState(() => this.value = value),
                              //         ),
                              //       )
                              //     ),
                              //   ],
                              // )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
