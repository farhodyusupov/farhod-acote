import 'package:equatable/equatable.dart';

import '../../data/models/user_model.dart';

abstract class UserListState extends Equatable {
  @override
  List<Object> get props => [];
}

class UserListInitial extends UserListState {}

class UserListLoading extends UserListState {}

class UserListLoaded extends UserListState {
  final List<UserModel> users;

  UserListLoaded(this.users);

  @override
  List<Object> get props => [users];
}

class UserListError extends UserListState {
  final String error;

  UserListError(this.error);

  @override
  List<Object> get props => [error];
}
