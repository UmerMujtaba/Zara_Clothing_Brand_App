
class Blog {
  final String id;
  final String tag;
  final String imageUrl;
  final String timestamp;


  Blog( {
    required this.id,
    required this.tag,
    required this.imageUrl,
    required this.timestamp,
  });

  // Convert a Product object into a map.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'tag': tag,
      'imageUrl': imageUrl,
      'timestamp': timestamp,
    };
  }

  // Create a Product object from a map.
  factory Blog.fromMap(Map<String, dynamic> map) {
    return Blog(
      id: map['id'] ?? '',
      tag: map['tag'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      timestamp: map['timestamp'] ??'',
    );
  }
}
