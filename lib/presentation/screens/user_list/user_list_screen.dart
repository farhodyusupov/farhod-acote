import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/user_list_bloc/user_list_bloc.dart';
import '../../../blocs/user_list_bloc/user_list_event.dart';
import '../../../blocs/user_list_bloc/user_list_state.dart';
import '../user_detail_screen/user_detail_screen.dart';

class UserListScreen extends StatefulWidget {
  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  void initState() {
    super.initState();
    // Dispatch the FetchUsers event as soon as the screen loads
    context.read<UserListBloc>().add(FetchUsers(0)); // Fetch first page of users
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GitHub Users')),
      body: BlocBuilder<UserListBloc, UserListState>(
        builder: (context, state) {
          if (state is UserListLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is UserListLoaded) {
            return ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (context, index) {
                final user = state.users[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user.avatarUrl),
                  ),
                  title: Text(user.login),
                  onTap: () {
                    // Navigate to UserDetailScreen with the selected user's username
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserDetailScreen(username: user.login),
                      ),
                    );
                  },
                );
              },
            );
          } else if (state is UserListError) {
            return Center(child: Text('Error: ${state.error}'));
          } else {
            return Center(child: Text('No users found'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<UserListBloc>().add(FetchUsers(0)); // Manually refresh users
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
