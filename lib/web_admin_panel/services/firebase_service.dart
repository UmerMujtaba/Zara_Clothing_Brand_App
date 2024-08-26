import 'dart:async';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/blog.dart';
import '../../model/product.dart';
import '../../model/user.dart';
import 'package:http/http.dart' as http;


Future<void> addProduct(String collectionName, Product product) async {
  dynamic res = await FirebaseFirestore.instance
      .collection(collectionName)
      .add(product.toMap());
}

Future<void> addBlog(String collectionName, Blog blog) async {
  dynamic result = await FirebaseFirestore.instance
      .collection(collectionName)
      .add(blog.toMap());
}


class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Function to fetch blogs from Firestore
  Future<List<Blog>> fetchBlogs() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('Blog').get();
      List<Blog> blogs = snapshot.docs.map((doc) {
        return Blog.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
      return blogs;
    } catch (e) {
      print('Error fetching blogs: $e');
      return [];
    }
  }



  //one func having list of collection as parameter
  Stream<List<Product>> fetchCombinedCollections(List<String> collectionNames) {
    // Convert each collection's stream to a stream of Product lists
    List<Stream<List<Product>>> streams = collectionNames.map((collectionName) {
      return _firestore.collection(collectionName).snapshots().map((snapshot) {
        return snapshot.docs.map((doc) {
          return Product.fromMap(doc.data() as Map<String, dynamic>);
        }).toList();
      });
    }).toList();

    // Merge the streams into one stream of product lists
    return Stream<List<Product>>.multi((controller) {
      List<Product> allProducts = [];

      for (var stream in streams) {
        stream.listen((products) {
          allProducts.addAll(products);
          controller.add(allProducts); // Emit combined product list
        });
      }
    });
  }







//for per collection
  Stream<List<Product>> fetchPerCollection(String collectionName) {
    return _firestore
        .collection(collectionName)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
      return Product.fromMap(doc.data() as Map<String, dynamic>);
    }).toList());
  }



  Future<void> sendNotification(UserModel user, String title, String body) async {
    final fcmToken = user.fcmToken;

    if (fcmToken!.isEmpty) {
      print("FCM token is empty. Can't send notification.");
      return;
    }

    final url = 'https://fcm.googleapis.com/fcm/send';
    final serverKey = 'YOUR_SERVER_KEY'; // Replace with your Firebase server key

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'key=$serverKey',
    };

    final notificationData = {
      'notification': {
        'title': title,
        'body': body,
      },
      'priority': 'high',
      'data': {
        'click_action': 'FLUTTER_NOTIFICATION_CLICK',
        'status': 'done',
      },
      'to': fcmToken,
    };

    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: json.encode(notificationData),
    );

    if (response.statusCode == 200) {
      print("Notification sent successfully");
    } else {
      print("Failed to send notification: ${response.statusCode}");
    }
  }

}