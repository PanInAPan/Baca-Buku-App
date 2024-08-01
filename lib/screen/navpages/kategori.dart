import 'package:baca_buku_app1/api_services.dart';
import 'package:baca_buku_app1/common/color.dart';
import 'package:baca_buku_app1/components/category_items.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Kategori extends StatefulWidget {
  const Kategori({super.key});

  @override
  State<Kategori> createState() => _KategoriState();
}

class _KategoriState extends State<Kategori> {

  late Future<List<dynamic>> _futureData;
  final CategoryApiService apiService = CategoryApiService();

  @override
  void initState() {
    super.initState();
    _futureData = apiService.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        title: Text(
          "Kategori",
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
      body: FutureBuilder<List<dynamic>>(
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
                  height: mediaQuery.height / 1.2,
                  child: CategoryItems(categories: snapshot.data!, books: snapshot.data!,));
            } else {
              return const Text('No Data');
            }
          })
    );
  }
}
