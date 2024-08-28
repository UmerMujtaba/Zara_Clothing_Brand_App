class UserModel {
  String? id;
  String name;
  String email;
  String password;
  String? fcmToken;
  String? address;
  String? city;
  String? country;
  String? postalCode;
  String? phoneNo;

  UserModel({
    this.id,
    required this.name,
    required this.email,
    required this.password,
    this.fcmToken,
    this.address,
    this.country,
    this.city,
    this.phoneNo,
    this.postalCode,
  });

  // Method to convert UserModel to a Map (useful for storing in Firestore)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'fcmToken': fcmToken,
      'address': address,
      'city':city,
      'country':country,
      'postalCode':postalCode,
      'phoneNo':phoneNo
    };
  }

  // Method to create a UserModel from a Map (useful for fetching from Firestore)
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      password: '',
      // Password should not be stored as plain text in a real app
      fcmToken: map['fcmToken'],
      address: map['address'],
      city: map['city'],
      country: map['country'],
      postalCode: map['postalCode'],
      phoneNo: map['phoneNo']
    );
  }
}
