import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String name;
  final String email;
  final int age;
  final String city;
  final String gender;
  final List<String> languages;
  final String avatarUrl;

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.age,
    required this.city,
    required this.gender,
    required this.languages,
    required this.avatarUrl,
  });

  @override
  List<Object?> get props => [id, name, email, age, city, gender, languages, avatarUrl];
}