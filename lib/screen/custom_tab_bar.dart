import 'package:baca_buku_app1/common/color.dart';
import 'package:baca_buku_app1/components/tab_item.dart';
import 'package:baca_buku_app1/screen/navpages/peminjaman.dart';
import 'package:baca_buku_app1/screen/navpages/pengembalian.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key});

  @override
  State<CustomTabBar> createState() => _HistoryState();
}

class _HistoryState extends State<CustomTabBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 75,
            title: Text(
              "Peminjaman Buku",
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(40),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  child: Container(
                    height: 42,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      border: Border.all(color: CustomColor.first, width: 2),
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      color: CustomColor.second,
                    ),
                    child:  TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: Colors.white,
                    unselectedLabelColor: CustomColor.first,
                    dividerColor: Colors.transparent,
                    indicator: BoxDecoration(
                      color: CustomColor.first,
                      borderRadius: const BorderRadius.all(Radius.circular(50))
                    ),
                    tabs: const [
                      TabItem(title: "Peminjaman"),
                      TabItem(title: "Pengembalian")
                    ]),
                  ),
                )),
          ),
          body: const TabBarView(
            children: [
              Peminjaman(),
              Pengembalian(),
            ]
          ),
        ));
  }
}
