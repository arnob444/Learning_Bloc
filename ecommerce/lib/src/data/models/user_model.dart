class UserModel {
  UserModel({
    required this.userName,
    required this.email,
    required this.photoUrl,
    required this.phoneNumber,
  });

  final String? userName;
  final String? email;
  final String? photoUrl;
  final String? phoneNumber;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userName: json["user_name"],
      email: json["email"],
      photoUrl: json["photoUrl"],
      phoneNumber: json["phoneNumber"],
    );
  }

  Map<String, dynamic> toJson() => {
    "user_name": userName,
    "email": email,
    "photoUrl": photoUrl,
    "phoneNumber": phoneNumber,
  };
}
