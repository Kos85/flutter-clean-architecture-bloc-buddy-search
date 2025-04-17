import '../entities/user_entity.dart';
import '../repositories/buddy_search_repository.dart';

class GetUsersUseCase {
  final BuddySearchRepository repository;

  GetUsersUseCase(this.repository);

  Future<List<UserEntity>> call() {
    return repository.getUsers();
  }

  Future<List<UserEntity>> searchUsers(String query) {
    return repository.searchUsers(query);
  }
}
