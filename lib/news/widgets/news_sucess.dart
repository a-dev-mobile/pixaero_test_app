import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_repository/news_repository.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsSuccess extends StatelessWidget {
  const NewsSuccess({
    Key? key,
    required this.newsList,
  }) : super(key: key);

  final List<News> newsList;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      clipBehavior: Clip.none,
      child: Column(
        children: newsList.map(buildCardNews).toList(),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    if (!await launch(url)) {
      // ignore: only_throw_errors
      throw 'Could not launch $url';
    }
  }

  Widget buildCardNews(News news) {
    return Card(
      elevation: 8,
      child: InkWell(
        splashColor: Colors.red.withAlpha(30),
        onTap: () => _launchURL(news.url),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Image.network(news.urlToImage),
                Text(
                  news.title,
                  style: GoogleFonts.lato(fontSize: 24),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(news.description),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
