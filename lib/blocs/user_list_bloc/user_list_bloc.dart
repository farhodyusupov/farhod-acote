import 'package:bloc/bloc.dart';

import '../../data/repositories/user_repository.dart';
import 'user_list_event.dart';
import 'user_list_state.dart';

class UserListBloc extends Bloc<UserListEvent, UserListState> {
  final UserRepository userRepository;

  UserListBloc(this.userRepository) : super(UserListInitial()) {
    on<FetchUsers>(_onFetchUsers);
  }

  // Handler for FetchUsers event
  void _onFetchUsers(FetchUsers event, Emitter<UserListState> emit) async {
    emit(UserListLoading());
    try {
      final users = await userRepository.getUsers(event.since);
      emit(UserListLoaded(users));
    } catch (e) {
      emit(UserListError('Failed to fetch users'));
    }
  }
}
