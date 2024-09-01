import 'package:equatable/equatable.dart';

abstract class UserReposEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchUserRepos extends UserReposEvent {
  final String username;

  FetchUserRepos(this.username);

  @override
  List<Object> get props => [username];
}
