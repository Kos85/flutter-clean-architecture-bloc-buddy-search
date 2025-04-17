import '../entities/user_entity.dart';

abstract class BuddySearchRepository {
  Future<List<UserEntity>> getUsers();
  Future<List<UserEntity>> searchUsers(String query);
}
