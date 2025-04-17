import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.age,
    required super.city,
    required super.gender,
    required super.languages,
    required super.avatarUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      age: json['age'],
      city: json['city'],
      gender: json['gender'],
      languages: List<String>.from(json['languages']),
      avatarUrl: json['avatarUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'age': age,
      'city': city,
      'gender': gender,
      'languages': languages,
      'avatarUrl': avatarUrl,
    };
  }
}
