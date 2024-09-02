class UserModel {
  String? id;
  String name;
  String email;
  String password;
  String? fcmToken;
  List<Map<String, dynamic>>? addresses;
  String? phoneNo;

  UserModel({
    this.id,
    required this.name,
    required this.email,
    required this.password,
    this.fcmToken,
    this.addresses,
    this.phoneNo,
  });

  // Method to convert UserModel to a Map (useful for storing in Firestore)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'fcmToken': fcmToken,
      'addresses': addresses,
      'phoneNo': phoneNo
    };
  }

  // Method to create a UserModel from a Map (useful for fetching from Firestore)
  factory UserModel.fromMap(Map<String, dynamic> map) {
    var addressesList = map['addresses'] as List<dynamic>? ?? [];
    var addresses = addressesList.map((e) {
      if (e is Map<String, dynamic>) {
        return {
          'address': e['address']?.toString() ?? '',
          'city': e['city']?.toString() ?? '',
          'state': e['state']?.toString() ?? '',
          'zipCode': e['zipCode']?.toString() ?? '',
        };
      }
      return <String,
          String>{}; // Default to an empty map if the type is incorrect
    }).toList();

    return UserModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      password: '',
      // Password should not be stored as plain text in a real app
      fcmToken: map['fcmToken'],
      addresses: addresses,
      phoneNo: map['phoneNo'],
    );
  }
}
