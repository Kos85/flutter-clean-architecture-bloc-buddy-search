import 'package:buddy_search_clean_architecture_bloc/features/buddy_search/domain/entities/user_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_users_usecase.dart';

part 'buddy_search_event.dart';
part 'buddy_search_state.dart';

class BuddySearchBloc extends Bloc<BuddySearchEvent, BuddySearchState> {
  final GetUsersUseCase getUsersUseCase;

  BuddySearchBloc(this.getUsersUseCase) : super(BuddySearchInitial()) {
    on<LoadBuddies>(_onLoadBuddies);
    on<SearchBuddies>(_onSearchBuddies);
  }

  Future<void> _onLoadBuddies(
      LoadBuddies event, Emitter<BuddySearchState> emit) async {
    emit(BuddySearchLoading());
    try {
      final users = await getUsersUseCase.call();
      emit(BuddySearchLoaded(users));
    } catch (e) {
      emit(BuddySearchError(e.toString()));
    }
  }

  Future<void> _onSearchBuddies(
      SearchBuddies event, Emitter<BuddySearchState> emit) async {
    emit(BuddySearchLoading());
    try {
      final results = await getUsersUseCase.searchUsers(event.query);
      emit(BuddySearchLoaded(results));
    } catch (e) {
      emit(BuddySearchError(e.toString()));
    }
  }
}
