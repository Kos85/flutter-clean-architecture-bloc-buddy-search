import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/styles/app_text_styles.dart';
import '../../domain/usecases/get_users_usecase.dart';
import '../bloc/buddy_search_bloc.dart';

import '../../data/repositories/buddy_search_repository_impl.dart';
import '../../data/datasources/buddy_search_mock_datasource.dart';
import '../widgets/buddy_card.dart';

class BuddySearchPage extends StatelessWidget {
  const BuddySearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = BuddySearchRepositoryImpl(BuddySearchMockDatasource());
    final getUsersUseCase = GetUsersUseCase(repository);
    return BlocProvider(
      create: (_) => BuddySearchBloc(getUsersUseCase
      )..add(LoadBuddies()), // load by default
      child: const BuddySearchView(),
    );
  }
}

class BuddySearchView extends StatelessWidget {
  const BuddySearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buddy Search', style: AppTextStyles.title),
        backgroundColor: AppColors.primary,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
              ),
              onChanged: (query) {
                context.read<BuddySearchBloc>().add(SearchBuddies(query));
              },
            ),
          ),
          Expanded(
            child: BlocBuilder<BuddySearchBloc, BuddySearchState>(
              builder: (context, state) {
                if (state is BuddySearchLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is BuddySearchLoaded) {
                  if (state.users.isEmpty) {
                    return const Center(
                      child: Text('No one found.', style: AppTextStyles.body),
                    );
                  }

                  return ListView.builder(
                    itemCount: state.users.length,
                    itemBuilder: (_, index) {
                      return BuddyCard(
                          user: state.users[index]); // Используем наш виджет
                    },
                  );
                } else if (state is BuddySearchError) {
                  return Center(
                    child: Text(
                        'Error: ${state.message}', style: AppTextStyles.body),
                  );
                }
                return const Center(
                  child: Text(
                      'Enter a name to search.', style: AppTextStyles.body),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
