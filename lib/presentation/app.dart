import 'package:farhod_acote/presentation/screens/user_list/user_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/user_list_bloc/user_list_bloc.dart';
import '../data/providers/api_provider.dart';
import '../data/repositories/user_repository_impl.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Initialize the API provider and repository
    final apiProvider = ApiProvider();
    final userRepository = UserRepositoryImpl(apiProvider);

    return MultiBlocProvider(
      providers: [
        // Provide the UserListBloc to the entire app
        BlocProvider<UserListBloc>(
          create: (context) => UserListBloc(userRepository),
        ),
      ],
      child: MaterialApp(
        title: 'GitHub Users App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: UserListScreen(),
        routes: {
          // Define additional routes here if needed
          '/home': (context) => UserListScreen(),
          // Add more routes for other screens like user details
        },
      ),
    );
  }
}
