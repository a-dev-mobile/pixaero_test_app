// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_repository/news_repository.dart';
import 'package:pixaero/l10n/l10n.dart';
import 'package:pixaero/news/news.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({Key? key, required NewsRepository newsRepository})
      : _newsRepository = newsRepository,
        super(key: key);

  final NewsRepository _newsRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _newsRepository,
      child: const NewsAppView(),
    );
  }
}

class NewsAppView extends StatelessWidget {
  const NewsAppView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.red,
          titleTextStyle: GoogleFonts.rajdhaniTextTheme(textTheme)
              .apply(bodyColor: Colors.white)
              .headline6,
        ),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFFEB2536),
        ),
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: const NewsPage(),
    );
  }
}
