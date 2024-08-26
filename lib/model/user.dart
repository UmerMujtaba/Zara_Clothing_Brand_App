class UserModel {
  String? id;
  String name;
  String email;
  String password;
  String? fcmToken;

  UserModel({
    this.id,
    required this.name,
    required this.email,
    required this.password,
    this.fcmToken,
  });

  // Method to convert UserModel to a Map (useful for storing in Firestore)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'fcmToken': fcmToken,
    };
  }

  // Method to create a UserModel from a Map (useful for fetching from Firestore)
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      password: '', // Password should not be stored as plain text in a real app
      fcmToken: map['fcmToken'],
    );
  }
}
