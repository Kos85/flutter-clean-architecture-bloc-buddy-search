import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/buddy_search_repository.dart';
import '../datasources/buddy_search_mock_datasource.dart';

class BuddySearchRepositoryImpl implements BuddySearchRepository {
  final BuddySearchMockDatasource datasource;

  BuddySearchRepositoryImpl(this.datasource);

  @override
  Future<List<UserEntity>> getUsers() {
    return datasource.fetchUsers();
  }

  @override
  Future<List<UserEntity>> searchUsers(String query) async {
    final allUsers = await getUsers();
    return allUsers
        .where((user) =>
        user.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
