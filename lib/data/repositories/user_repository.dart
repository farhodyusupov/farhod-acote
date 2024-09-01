import '../models/repo_model.dart';
import '../models/user_model.dart';

abstract class UserRepository {
  Future<List<UserModel>> getUsers(int since);
  Future<List<RepoModel>> getUserRepos(String username);
}
