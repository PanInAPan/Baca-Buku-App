import 'package:baca_buku_app1/common/color.dart';
import 'package:baca_buku_app1/screen/navpages/beranda.dart';
import 'package:baca_buku_app1/screen/custom_tab_bar.dart';
import 'package:baca_buku_app1/screen/navpages/kategori.dart';
import 'package:baca_buku_app1/screen/navpages/koleksi.dart';
import 'package:flutter/material.dart';

var key = CustomTabBar();

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  var currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        children: const [
          Beranda(),
          Kategori(),
          Koleksi(),
          CustomTabBar()
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(20),
          height: mediaQuery.width * .155,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(.15),
                    blurRadius: 30,
                    offset: const Offset(0, 10))
              ],
              borderRadius: BorderRadius.circular(20)),
          child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: mediaQuery.width * .024),
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                setState(() {
                  currentIndex = index;
                });
                _pageController.jumpToPage(index);
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 1500),
                    curve: Curves.fastLinearToSlowEaseIn,
                    margin: EdgeInsets.only(
                        bottom:
                            index == currentIndex ? 0 : mediaQuery.width * .029,
                        right: mediaQuery.width * .0422,
                        left: mediaQuery.width * .0422),
                    width: mediaQuery.width * .128,
                    height: index == currentIndex ? mediaQuery.width * .014 : 0,
                    decoration: BoxDecoration(
                        color: CustomColor.first,
                        borderRadius: const BorderRadius.vertical(
                            bottom: Radius.circular(10))),
                  ),
                  Icon(
                    listOfIcons[index],
                    size: mediaQuery.width * .076,
                    color:
                        index == currentIndex ? CustomColor.first : Colors.black,
                  ),
                  SizedBox(
                    height: mediaQuery.width * .03,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.category_rounded,
    Icons.bookmark_rounded,
    Icons.shopping_cart_rounded,
  ];
}
