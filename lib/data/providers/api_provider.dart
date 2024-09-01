import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/repo_model.dart';
import '../models/user_model.dart';

class ApiProvider {
  final String baseUrl = 'https://api.github.com';

  Future<List<UserModel>> fetchUsers(int since) async {
    final response = await http.get(Uri.parse('$baseUrl/users?since=$since'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);

      return data.map((json) => UserModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<List<RepoModel>> fetchUserRepos(String username) async {
    final response = await http.get(Uri.parse('$baseUrl/users/$username/repos'));
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => RepoModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load repos');
    }
  }
}
