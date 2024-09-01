import 'package:equatable/equatable.dart';

abstract class UserListEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchUsers extends UserListEvent {
  final int since;

  FetchUsers(this.since);

  @override
  List<Object> get props => [since];
}
