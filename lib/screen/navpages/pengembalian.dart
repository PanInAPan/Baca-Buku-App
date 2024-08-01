import 'package:baca_buku_app1/api_services.dart';
import 'package:baca_buku_app1/components/book_card.dart';
import 'package:flutter/material.dart';

class Pengembalian extends StatefulWidget {
  const Pengembalian({super.key});

  @override
  State<Pengembalian> createState() => _PengembalianState();
}

class _PengembalianState extends State<Pengembalian> {
  late Future<List<dynamic>> _futureData;
  final ReturnedBookApiService apiService = ReturnedBookApiService();

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
                        child: ReturnedBookList(booksOnReturn: snapshot.data!, books: snapshot.data!,)
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
