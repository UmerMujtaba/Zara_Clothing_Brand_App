// Define product lists for each category
// ignore: unused_import
// ignore_for_file: non_constant_identifier_names

class Product {
  final String image;
  final String name;
  final String price;
  final String tag;

  Product({required this.image, required this.name, required this.price, required this.tag});
}


final List<Product> allProducts = [
  Product(
    image: 'lib/images/category/1.jpg',
    name: 'Leather Jacket',
    price: '\$220',
    tag: '21WN',
  ),

  Product(
    image: 'lib/images/category/2.jpg',
    name: 'Parachute Jacket',
    price: '\$20',
    tag: '2WN',
  ),

  Product(
    image: 'lib/images/category/3.jpg',
    name: 'Denim Jacket',
    price: '\$320',
    tag: '22WN',
  ),

  Product(
    image: 'lib/images/category/5.png',
    name: 'Puffer Jacket',
    price: '\$200',
    tag: '32WN',
  ),

  Product(
    image: 'lib/images/category/14.jpg',
    name: 'Hoddie',
    price: '\$20',
    tag: '43WN',
  ),

  // Add more products for this category
];

final List<Product> outerProducts = [
  Product(
    image: 'lib/images/category/9.jpg',
    name: 'Collared Shirts',
    price: '\$40',
    tag: 'Summer Collection',
  ),

  Product(
    image: 'lib/images/category/10.jpg',
    name: 'Collared Beach Shirts',
    price: '\$20',
    tag: 'Summer Collection',
  ),

  // Add more products for this category
];

final List<Product> DressProducts = [
  Product(
    image: 'lib/images/1.jpg',
    name: 'Dress ',
    price: '\$80',
    tag: 'Collection',
  ),

  Product(
    image: 'lib/images/2.jpg',
    name: 'Dress',
    price: '\$70',
    tag: 'Collection',
  ),

  Product(
    image: 'lib/images/5.jpg',
    name: 'Party Wear',
    price: '\$90',
    tag: 'Collection',
  ),

  Product(
    image: 'lib/images/summer.jpg',
    name: 'Summer Dresses',
    price: '\$220',
    tag: 'Collection',
  ),

  Product(
    image: 'lib/images/4.jpg',
    name: 'Dress',
    price: '\$30',
    tag: 'Collection',
  ),


  // Add more products for this category
];

final List<Product> TshirtProducts = [
  Product(
    image: 'lib/images/tshirt/1.jpg',
    name: 'Plain',
    price: '\$9',
    tag: 'Tees Collection',
  ),

  Product(
    image: 'lib/images/tshirt/2.jpg',
    name: 'Cotton',
    price: '\$25',
    tag: 'Tees Collection',
  ),

  Product(
    image: 'lib/images/tshirt/3.jpg',
    name: 'Imported',
    price: '\$40',
    tag: 'Tees Collection',
  ),

  Product(
    image: 'lib/images/tshirt/4.jpg',
    name: 'White Plain',
    price: '\$180',
    tag: 'Tees Collection',
  ),

  // Add more products for this category
];

final List<Product> SkirtProdcuts = [
  Product(
    image: 'lib/images/category/2.jpg',
    name: 'Coat',
    price: '\$180',
    tag: 'Winter Collection',
  ),
  // Add more products for this category
];

// Define product lists for other categories similarly

final List<Product> BagLeatherProducts = [
  Product(
    image: 'lib/images/bags/leather/2.jpg',
    name: 'Leather',
    price: '\$180',
    tag: 'Bag Collection',
  ),

  Product(
    image: 'lib/images/bags/leather/3.jpg',
    name: 'Leather Brown',
    price: '\$40',
    tag: 'Bag Collection',
  ),

  Product(
    image: 'lib/images/bags/leather/4.jpg',
    name: 'Classic',
    price: '\$200',
    tag: 'Bag Collection',
  ),

  Product(
    image: 'lib/images/bags/leather/5.jpg',
    name: 'Latest',
    price: '\$80',
    tag: 'Bag Collection',
  ),
  // Add more products for this category
];

final List<Product> BagFancyProducts = [
  Product(
    image: 'lib/images/bags/fancy/2.jpg',
    name: 'Classic',
    price: '\$30',
    tag: 'Special Addition',
  ),

  Product(
    image: 'lib/images/bags/fancy/3.jpg',
    name: 'Simple',
    price: '\$50',
    tag: 'Special Addition',
  ),

  Product(
    image: 'lib/images/bags/fancy/4.jpg',
    name: 'Latest',
    price: '\$70',
    tag: 'Special Addition',
  ),

  Product(
    image: 'lib/images/bags/fancy/5.jpg',
    name: 'Modern',
    price: '\$200',
    tag: 'Special Addition',
  ),
  // Add more products for this category
];
final List<Product> GlassesProducts = [
  Product(
    image: 'lib/images/glasses/2.jpg',
    name: 'PRADA',
    price: '\$40',
    tag: 'Sun Wear Collection',
  ),

  Product(
    image: 'lib/images/glasses/3.jpg',
    name: 'Ray Ban',
    price: '\$80',
    tag: 'Sun Wear Collection',
  ),

  Product(
    image: 'lib/images/glasses/4.jpg',
    name: 'Modern',
    price: '\$30',
    tag: 'Sun Wear Collection',
  ),

  Product(
    image: 'lib/images/glasses/5.jpg',
    name: 'Classy',
    price: '\$70',
    tag: 'Sun Wear Collection',
  ),
  // Add more products for this category
];

final List<Product> HatsProducts = [
  Product(
    image: 'lib/images/hats/2.jpg',
    name: 'Classy',
    price: '\$30',
    tag: 'Hats Collection',
  ),

  Product(
    image: 'lib/images/hats/3.jpg',
    name: 'Latest',
    price: '\$80',
    tag: 'Hats Collection',
  ),

  Product(
    image: 'lib/images/hats/4.jpg',
    name: 'Modern',
    price: '\$90',
    tag: 'Hats Collection',
  ),
  // Add more products for this category
];