import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_repository/news_repository.dart';
import 'package:pixaero/l10n/l10n.dart';
import 'package:pixaero/news/news.dart';
import 'package:pixaero/news/widgets/widgets.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewsCubit(context.read<NewsRepository>()),
      child: const NewsView(),
    );
  }
}

class NewsView extends StatelessWidget {
  const NewsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appBarTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: BlocBuilder<NewsCubit, NewsState>(
          builder: (context, state) {
            switch (state.status) {
              case NewsStatus.initial:
                return const NewsInit();
              case NewsStatus.loading:
                return const NewsLoading();
              case NewsStatus.success:
                return NewsSuccess(
                  newsList: state.newsList,
                );
              case NewsStatus.failure:
                return const NewsError();
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<NewsCubit>().fetchNews(),
        child: const Icon(Icons.update),
      ),
    );
  }
}
