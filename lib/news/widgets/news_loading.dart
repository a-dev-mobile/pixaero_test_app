import 'package:flutter/material.dart';

class NewsLoading extends StatelessWidget {
  const NewsLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('📰', style: TextStyle(fontSize: 64)),
        Text(
          'Загрузка ...',
          style: theme.textTheme.headline5,
        ),
        const Padding(
          padding: EdgeInsets.all(16),
          child: CircularProgressIndicator(),
        ),
      ],
    );
  }
}
