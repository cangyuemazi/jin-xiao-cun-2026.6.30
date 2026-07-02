import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:jin_xiao_cun_2026/app/app.dart';
import 'package:jin_xiao_cun_2026/app/app_providers.dart';
import 'package:jin_xiao_cun_2026/data/database/app_database.dart';

void main() {
  testWidgets('app starts with shared theme', (WidgetTester tester) async {
    final database = AppDatabase.forExecutor(NativeDatabase.memory());
    addTearDown(database.close);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [appDatabaseProvider.overrideWithValue(database)],
        child: const JinXiaoCunApp(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('首页'), findsWidgets);
    expect(find.text('经营概览'), findsOneWidget);
  });
}
