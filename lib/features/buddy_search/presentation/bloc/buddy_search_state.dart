part of 'buddy_search_bloc.dart';

abstract class BuddySearchState {}

class BuddySearchInitial extends BuddySearchState {}

class BuddySearchLoading extends BuddySearchState {}

class BuddySearchLoaded extends BuddySearchState {
  final List<UserEntity> users;

  BuddySearchLoaded(this.users);
}

class BuddySearchError extends BuddySearchState {
  final String message;

  BuddySearchError(this.message);
}
