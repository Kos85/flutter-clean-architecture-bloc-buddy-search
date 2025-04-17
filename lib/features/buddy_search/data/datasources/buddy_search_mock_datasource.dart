import '../models/user_model.dart';

class BuddySearchMockDatasource {
  Future<List<UserModel>> fetchUsers() async {
    await Future.delayed(const Duration(milliseconds: 500)); // delay simulation

    return [
      UserModel(
        id: '1',
        name: 'Alice',
        email:'email',
        age: 25,
        city: 'Kyiv',
        gender: 'female',
        languages: ['Ukrainian', 'English'],
        avatarUrl: "https://randomuser.me/api/portraits/men/1.jpg",
      ),
      UserModel(
        id: '2',
        name: 'Bob',
        email:'email',
        age: 28,
        city: 'Lviv',
        gender: 'male',
        languages: ['Ukrainian', 'Polish'],
        avatarUrl: "https://randomuser.me/api/portraits/men/2.jpg",
      ),
    ];
  }
}
