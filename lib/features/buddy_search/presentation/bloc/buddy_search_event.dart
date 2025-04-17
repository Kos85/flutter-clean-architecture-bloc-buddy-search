part of 'buddy_search_bloc.dart';

abstract class BuddySearchEvent {}

class LoadBuddies extends BuddySearchEvent {}

class SearchBuddies extends BuddySearchEvent {
  final String query;

  SearchBuddies(this.query);
}
