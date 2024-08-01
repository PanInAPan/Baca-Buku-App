import 'package:baca_buku_app1/api_services.dart';
import 'package:baca_buku_app1/components/book_card.dart';
import 'package:flutter/material.dart';

class Peminjaman extends StatefulWidget {
  const Peminjaman({super.key});

  @override
  State<Peminjaman> createState() => _PeminjamanState();
}

class _PeminjamanState extends State<Peminjaman> {
  late Future<List<dynamic>> _futureData;
  final BorrowedBookApiService apiService = BorrowedBookApiService();

  @override
  void initState() {
    super.initState();
    _futureData = apiService.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: FutureBuilder<List<dynamic>>(
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
                        height: mediaQuery.height / 1.23,
                        child: BorrowedBookList(booksOnBorrow: snapshot.data!)
                      );
                  } else {
                    return const Text('No Data');
                  }
                }),
          ),
        ],
      ),
    );
  }
}
