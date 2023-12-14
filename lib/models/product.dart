class Product {
  final String name;
  final double price;
  final String description;
  final String imagePath;
  

  Product({
    required this.name,
    required this.price,
    required this.description,
    required this.imagePath,
    
  });
}

class Cart {
  final int qty;
  final double total;

  Cart({
    required this.qty,
    required this.total,
  });
}