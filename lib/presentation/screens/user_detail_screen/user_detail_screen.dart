import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/user_repos_bloc/user_repos_bloc.dart';
import '../../../blocs/user_repos_bloc/user_repos_event.dart';
import '../../../blocs/user_repos_bloc/user_repos_state.dart';
import '../../../data/providers/api_provider.dart';
import '../../../data/repositories/user_repository_impl.dart';

class UserDetailScreen extends StatelessWidget {
  final String username;

  UserDetailScreen({required this.username});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final apiProvider = ApiProvider();
        final userRepository = UserRepositoryImpl(apiProvider);
        return UserReposBloc(userRepository)..add(FetchUserRepos(username));
      },
      child: Scaffold(
        appBar: AppBar(title: Text('$username\'s Repositories')),
        body: BlocBuilder<UserReposBloc, UserReposState>(
          builder: (context, state) {
            if (state is UserReposLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is UserReposLoaded) {
              return ListView.builder(
                itemCount: state.repos.length,
                itemBuilder: (context, index) {
                  final repo = state.repos[index];
                  return ListTile(
                    title: Text(repo.name),
                    subtitle: Text(repo.description ?? 'No description available'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.star, color: Colors.yellow),
                        Text('${repo.stargazersCount}'),
                      ],
                    ),
                  );
                },
              );
            } else if (state is UserReposError) {
              return Center(child: Text('Error: ${state.error}'));
            } else {
              return Center(child: Text('No repositories found'));
            }
          },
        ),
      ),
    );
  }
}
