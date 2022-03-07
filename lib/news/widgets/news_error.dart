import 'package:flutter/material.dart';

class NewsError extends StatelessWidget {
  const NewsError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('🙈', style: TextStyle(fontSize: 64)),
        Text(
          'Что-то пошло не так!',
          style: theme.textTheme.headline5,
        ),
      ],
    );
  }
}
