import '../models/repo_model.dart';
import '../models/user_model.dart';
import '../providers/api_provider.dart';
import 'user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final ApiProvider apiProvider;

  UserRepositoryImpl(this.apiProvider);

  @override
  Future<List<UserModel>> getUsers(int since) {
    return apiProvider.fetchUsers(since);
  }

  @override
  Future<List<RepoModel>> getUserRepos(String username) {
    return apiProvider.fetchUserRepos(username);
  }
}
