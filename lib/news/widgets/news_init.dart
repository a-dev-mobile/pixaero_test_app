import 'package:flutter/material.dart';

class NewsInit extends StatelessWidget {
  const NewsInit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Нажмите на кнопку для загрузки',
          style: theme.textTheme.headline5,
        ),
        const Text('🤹', style: TextStyle(fontSize: 80)),
      ],
    );
  }
}
