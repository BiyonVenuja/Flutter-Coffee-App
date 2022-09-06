import 'dart:ui';
import 'package:coffe_app/models/util.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class ProductTile extends StatelessWidget {
  final String name;
  final String extras;
  final double price;
  final double ratings;
  final String imageUrl;
  final String indexname;

  ProductTile(
      {required this.imageUrl,
      required this.name,
      required this.extras,
      required this.price,
      required this.ratings,
      required this.indexname});
  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        width: MediaQuery.of(context).size.width / 2 - 30,
        height: Platform.isAndroid ? 260 : 250,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          boxShadow: [
            BoxShadow(color: Color(0x10808080)),
          ],
          gradient: primaryGradient,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                child: Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: 0.3 / 0.3,
                      child: Hero(
                        tag: indexname,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(imageUrl),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(20)),
                        child: Container(
                          height: 25,
                          width: 60,
                          color: Colors.black54,
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 15,
                                  color: accentColor,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  ratings.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 12),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      extras,
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${price.toString()}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 40,
                    width: 40,
                    child: Ink(
                      decoration: const ShapeDecoration(
                        color: accentColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.add),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
