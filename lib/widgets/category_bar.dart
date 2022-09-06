import 'dart:ui';

import 'package:coffe_app/models/util.dart';
import 'package:flutter/material.dart';
import 'package:coffe_app/pages/cappuccino.dart';

class CategoryBar extends StatefulWidget {
  final List<Tab> categories;
  CategoryBar({required this.categories});
  @override
  State<CategoryBar> createState() => _CategoryBarState();
}

class _CategoryBarState extends State<CategoryBar>
    with TickerProviderStateMixin {
  @override
  late TabController _tabController;
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController =
        TabController(length: widget.categories.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          padding: const EdgeInsets.only(top: 10),
          labelStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w800,
          ),
          indicatorColor: accentColor,
          isScrollable: true,
          tabs: widget.categories,
          unselectedLabelColor: Colors.white,
          labelColor: accentColor,
          controller: _tabController,
        ),
        SizedBox(
          height: 280,
          child: TabBarView(
            controller: _tabController,
            children: [
              const CappucinoPage(),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c5/Roasted_coffee_beans.jpg/800px-Roasted_coffee_beans.jpg'))),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Center(
                      child: Text(
                        'Too Lazy to add demo',
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                    ),
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c5/Roasted_coffee_beans.jpg/800px-Roasted_coffee_beans.jpg'))),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Center(
                      child: Text(
                        'Too Lazy to add demo',
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                    ),
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c5/Roasted_coffee_beans.jpg/800px-Roasted_coffee_beans.jpg'))),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Center(
                      child: Text(
                        'Too Lazy to add demo',
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
