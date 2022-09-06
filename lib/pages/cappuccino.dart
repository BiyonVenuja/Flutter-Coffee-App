import 'package:coffe_app/widgets/product_tile.dart';
import 'package:coffe_app/pages/product_page.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';

final List<Product> cappuccinoProducts = [
  Product(
    'This simple, delicious recipe will have a café style cappuccino in your mug with creamy and frothy UNCLE TOBYS Barista Oat Milk and the robust flavour of NESCAFE Farmers Origin Coffee.',
    name: 'Cappuccino',
    imageUrl:
        'https://images.unsplash.com/photo-1572442388796-11668a67e53d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Y2FwcHVjY2lub3xlbnwwfHwwfHw%3D&w=1000&q=80',
    price: 4.39,
    ratings: 5.0,
    extras: 'with Oat Milk',
  ),
  Product(
    'This simple, delicious recipe will have a café style cappuccino in your mug with creamy and frothy UNCLE TOBYS Barista Oat Milk and the robust flavour of NESCAFE Farmers Origin Coffee.',
    name: 'Cappuccino',
    imageUrl:
        'https://static.vecteezy.com/system/resources/previews/001/898/790/large_2x/a-cup-of-art-latte-or-cappuccino-coffee-with-retro-filter-effect-free-photo.jpg',
    price: 3.14,
    ratings: 4.2,
    extras: 'with Chocolate',
  ),
  Product(
    'This simple, delicious recipe will have a café style cappuccino in your mug with creamy and frothy UNCLE TOBYS Barista Oat Milk and the robust flavour of NESCAFE Farmers Origin Coffee.',
    name: 'Cappuccino',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7c/Cappuccino_Chiang_Mai.JPG/220px-Cappuccino_Chiang_Mai.JPG',
    price: 10.00,
    ratings: 2.0,
    extras: 'with Froth Art',
  )
];

class CappucinoPage extends StatelessWidget {
  const CappucinoPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 20),
      separatorBuilder: (context, index) => const SizedBox(
        width: 10,
      ),
      itemCount: cappuccinoProducts.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductPage(
                        product: cappuccinoProducts[index],
                        indexname: 'image${index}',
                      )));
        },
        child: ProductTile(
            indexname: 'image${index}',
            imageUrl: cappuccinoProducts[index].imageUrl,
            name: cappuccinoProducts[index].name,
            extras: cappuccinoProducts[index].extras,
            price: cappuccinoProducts[index].price,
            ratings: cappuccinoProducts[index].ratings),
      ),
    );
  }
}
