// ignore_for_file: duplicate_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../classes/classes.dart';
import '../model/cart.dart';
import '../model/product.dart';
import '../web_admin_panel/panels_scaffolds/desktop_scaffold.dart';
import '../web_admin_panel/services/firebase_service.dart';





class LoginNotifier extends StateNotifier<LoginState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  LoginNotifier() : super(LoginState());

  Future<void> login(String email, String password) async {
    state = LoginState(isLoading: true);
    try {
      final UserCredential userCredential =
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
        sharedPreferences.setString('email', email.trim());
        state = LoginState(); // Reset state after successful login
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'An unexpected error occurred.';
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password provided for that user.';
      } else if (e.code == 'invalid-email') {
        errorMessage = 'The email address is invalid.';
      }
      state = LoginState(isLoading: false, error: errorMessage);
    } catch (e) {
      state = LoginState(
          isLoading: false, error: 'An unexpected error occurred.');
    }
  }
}



final isSortedAscendingProvider = StateProvider<bool>((ref) => true);
final selectedColorProvider = StateProvider<String>((ref) => 'Red');
final selectedSizeProvider = StateProvider<String>((ref) => 'Small');

// Provider for FirebaseService
final firebaseServiceProvider = Provider<FirebaseService>((ref) {
  return FirebaseService();
});

// Stream Provider for Products
final productsProvider = StreamProvider.autoDispose.family<List<Product>, String>((ref, collectionName) {
  final firebaseService = ref.read(firebaseServiceProvider);
  return firebaseService.fetchPerCollection(collectionName);
});



final productsCombinedProvider = StreamProvider.family<List<Product>, List<String>>((ref, collectionNames) {
  final firebaseService = FirebaseService();
  return firebaseService.fetchCombinedCollections(collectionNames);
});

final productProvider = Provider<Product>((ref) {
  throw UnimplementedError(); // Replace with actual implementation
});


// Provider for the current screen
final currentScreenProvider = StateProvider<AdminPanelScreen>((ref) => AdminPanelScreen.welcome);

// Provider for the selected item name
final selectedItemNameProvider = StateProvider<String>((ref) => '');

// Provider for the touched index in the pie chart
final touchedIndexProvider = StateProvider<int>((ref) => -1);

// Provider for fetching collection counts
final collectionCountsProvider = FutureProvider<Map<String, int>>((ref) async {
  List<String> collections = [
    'Leather', 'Dress', 'Outer', 'Glasses', 'Hat', 'Tshirts', 'Fancy'
  ];
  Map<String, int> collectionCounts = {};

  for (String collection in collections) {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection(collection).get();
    collectionCounts[collection] = querySnapshot.size;
  }

  return collectionCounts;
});


final isExpanded2Provider = StateProvider<bool>((ref) => false);