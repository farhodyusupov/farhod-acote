import 'package:equatable/equatable.dart';

import '../../data/models/repo_model.dart';

abstract class UserReposState extends Equatable {
  @override
  List<Object> get props => [];
}

class UserReposInitial extends UserReposState {}

class UserReposLoading extends UserReposState {}

class UserReposLoaded extends UserReposState {
  final List<RepoModel> repos;

  UserReposLoaded(this.repos);

  @override
  List<Object> get props => [repos];
}

class UserReposError extends UserReposState {
  final String error;

  UserReposError(this.error);

  @override
  List<Object> get props => [error];
}
