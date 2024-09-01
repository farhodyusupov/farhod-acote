import 'package:bloc/bloc.dart';

import '../../data/repositories/user_repository.dart';
import 'user_repos_event.dart';
import 'user_repos_state.dart';

class UserReposBloc extends Bloc<UserReposEvent, UserReposState> {
  final UserRepository userRepository;

  UserReposBloc(this.userRepository) : super(UserReposInitial()) {
    on<FetchUserRepos>(_onFetchUserRepos);
  }

  void _onFetchUserRepos(FetchUserRepos event, Emitter<UserReposState> emit) async {
    emit(UserReposLoading());
    try {
      final repos = await userRepository.getUserRepos(event.username);
      emit(UserReposLoaded(repos));
    } catch (e) {
      emit(UserReposError('Failed to fetch repositories'));
    }
  }
}
