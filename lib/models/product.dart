class Product {
  final String name;
  final double price;
  final int rating;
  final String product_image;

  Product({
    required this.name,
    required this.price,
    required this.rating,
    required String productImage,
  }) : product_image = 'https://web-production-6aa6.up.railway.app$productImage';
}
