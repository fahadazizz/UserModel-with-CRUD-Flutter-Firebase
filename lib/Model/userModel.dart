class UserModel {
  final String uid;
  final String fullName;
  final String userName;
  final String Gender;
  final String email;

  UserModel({
    required this.uid,
    required this.fullName,
    required this.userName,
    required this.Gender,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'fullName': fullName,
      'userName': userName,
      'gender': Gender,
      'email': email,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      fullName: map['fullName'],
      userName: map['userName'],
      Gender: map['gender'],
      email: map['email'],
    );
  }
}
