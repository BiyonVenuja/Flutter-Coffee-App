import 'dart:ui';

import 'package:coffe_app/widgets/post_tile.dart';
import 'package:flutter/material.dart';
import 'package:coffe_app/widgets/category_bar.dart';

import '../models/util.dart';

final List<Tab> tabs = [
  const Tab(
    text: 'Cappuccino',
  ),
  const Tab(
    text: 'Espresso',
  ),
  const Tab(
    text: 'Latte',
  ),
  const Tab(
    text: 'Flat White',
  ),
];

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.blur_on,
          size: 30,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(
              Icons.person,
              size: 35,
            ),
          )
        ],
      ),
      // bottomNavigationBar: BottomBar(),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: ListView(
              clipBehavior: Clip.antiAlias,
              children: [
                const Text(
                  'Find the best coffee for you',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: TextField(
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                        hintText: '🔎 Find your coffee..',
                        hintStyle: TextStyle(
                          color: Colors.grey[600],
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 20),
                        constraints: BoxConstraints(
                          maxHeight: 45,
                        ),
                        fillColor: Colors.white.withOpacity(0.1),
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            style: BorderStyle.none,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            style: BorderStyle.none,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                ),
                CategoryBar(
                  categories: tabs,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  'Special For You..',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      PostTile(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomBar(),
          ),
        ],
      ),
    );
  }
}

class BottomBar extends StatefulWidget {
  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: primaryColor.withOpacity(0.7),
          onTap: (index) => {
            //
            setState(() {
              currentIndex = index;
            })
          },
          currentIndex: currentIndex,
          selectedItemColor: accentColor,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          iconSize: 30,
          selectedIconTheme: IconThemeData(
            size: 30,
          ),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Fav',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notifi',
            ),
          ],
        ),
      ),
    );
  }
}
