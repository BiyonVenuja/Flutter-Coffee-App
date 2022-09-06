class Product {
  final String name;
  final String imageUrl;
  final double price;
  final double ratings;
  String description;
  String extras;

  Product(this.description,
      {required this.name,
      required this.imageUrl,
      required this.price,
      required this.ratings,
      required this.extras});
}
