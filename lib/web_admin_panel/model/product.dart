
class AddProduct {
  final String id;
  final String name;
  final double price;
  final String description;
  final String tag;
  final String imageUrl;
  final String timestamp;


  AddProduct( {
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.tag,
    required this.imageUrl,
    required this.timestamp,
  });

  // Convert a Product object into a map.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'tag': tag,
      'imageUrl': imageUrl,
      'timestamp': timestamp,
    };
  }

  // Create a Product object from a map.
  factory AddProduct.fromMap(Map<String, dynamic> map) {
    return AddProduct(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      description: map['description'] ?? '',
      tag: map['tag'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      timestamp: map['timestamp'] ??'',
    );
  }
}
