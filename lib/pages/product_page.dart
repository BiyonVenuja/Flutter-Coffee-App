import 'dart:ui';
import 'dart:io';
import 'package:flutter/material.dart';
import '../widgets/size_selector.dart';
import '../models/product.dart';
import '../widgets/description_box.dart';
import '../models/util.dart';

class ProductPage extends StatelessWidget {
  final Product product;
  final String indexname;
  ProductPage({required this.product, required this.indexname});
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? SafeArea(
            child: ProductPageBody(
              product: product,
              indexname: indexname,
            ),
          )
        : ProductPageBody(
            product: product,
            indexname: indexname,
          );
  }
}

class ProductPageBody extends StatelessWidget {
  late Product product;
  final String indexname;
  ProductPageBody({required this.product, required this.indexname});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 450,
            child: Stack(
              children: [
                //Product Image
                Hero(
                  tag: indexname,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(product.imageUrl)),
                      borderRadius: Platform.isIOS
                          ? const BorderRadius.all(Radius.circular(30))
                          : const BorderRadius.vertical(
                              bottom: Radius.circular(30)),
                    ),
                  ),
                ),
                //Product Name and Other Details
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaY: 10, sigmaX: 10),
                      child: Container(
                        height: 140,
                        color: Colors.black45,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 25, right: 25, bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.name,
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    product.extras,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: textAccentColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.star,
                                          size: 30, color: accentColor),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        product.ratings.toString(),
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 55,
                                        width: 55,
                                        decoration: const BoxDecoration(
                                            color: const Color(0xff182025),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15))),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const <Widget>[
                                            Icon(
                                              Icons.coffee,
                                              color: accentColor,
                                            ),
                                            Text(
                                              'Coffee',
                                              style: TextStyle(
                                                color: textAccentColor,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        height: 55,
                                        width: 55,
                                        decoration: const BoxDecoration(
                                            color: Color(0xff182025),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15))),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const <Widget>[
                                            Icon(
                                              Icons.water_drop,
                                              color: accentColor,
                                            ),
                                            Text(
                                              'Milk',
                                              style: TextStyle(
                                                color: textAccentColor,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(
                                        color: Color(0xff182025),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    height: 30,
                                    width: 120,
                                    alignment: Alignment.center,
                                    child: const Text(
                                      'Medium Roasted',
                                      style: TextStyle(
                                        color: textAccentColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                //App bar
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: AppBar(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    leading: Ink(
                      decoration: const ShapeDecoration(
                        color: Color(0xff212121),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                      child: IconButton(
                        iconSize: 20,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.keyboard_arrow_left,
                          color: textAccentColor,
                        ),
                      ),
                    ),
                    actions: [
                      Ink(
                        decoration: const ShapeDecoration(
                          color: Color(0xff212121),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                        ),
                        child: IconButton(
                          iconSize: 20,
                          constraints:
                              const BoxConstraints(minHeight: 10, minWidth: 55),
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite,
                            color: textAccentColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          //Description
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        DescriptionBox(descritionText: product.description),
                        SizeSelectorBox((selectedItem) {
                          print(selectedItem);
                        }),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: Platform.isAndroid
                        ? MainAxisAlignment.spaceEvenly
                        : MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Price',
                            style:
                                TextStyle(color: textAccentColor, fontSize: 16),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            '\$${product.price.toString()}',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w800),
                          )
                        ],
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 70, right: 70, top: 10, bottom: 10),
                          child: Text(
                            'Buy Now',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ),
                        style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.white),
                            backgroundColor: MaterialStateProperty.resolveWith(
                                (states) => accentColor),
                            shape: MaterialStateProperty.resolveWith((states) =>
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20))))),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
