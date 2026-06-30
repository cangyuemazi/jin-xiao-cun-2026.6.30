import 'package:flutter/material.dart';

import '../shared/theme/app_spacing.dart';
import '../shared/theme/app_theme.dart';

class JinXiaoCunApp extends StatelessWidget {
  const JinXiaoCunApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JinXiaoCun 2026',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const _ThemePreviewShell(),
    );
  }
}

class _ThemePreviewShell extends StatelessWidget {
  const _ThemePreviewShell();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xxl),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.xxl),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('JinXiaoCun 2026', style: textTheme.headlineMedium),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    'UI theme foundation is ready.',
                    style: textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
