import 'package:cloud_firestore/cloud_firestore.dart';


import '../model/blog.dart';
import '../model/product.dart';
Future<void> addProduct(String collectionName,AddProduct product)async{

  dynamic res=await FirebaseFirestore.instance.
  collection(collectionName).add(product.toMap());


}


Future<void> addBlog(String collectionName,Blog blog)async{
  dynamic result=await FirebaseFirestore.instance.
  collection(collectionName).add(blog.toMap());

}