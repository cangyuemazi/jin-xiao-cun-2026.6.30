import 'package:flutter_test/flutter_test.dart';

import 'package:jin_xiao_cun_2026/app/app.dart';

void main() {
  testWidgets('app starts with shared theme', (WidgetTester tester) async {
    await tester.pumpWidget(const JinXiaoCunApp());

    expect(find.text('JinXiaoCun 2026'), findsOneWidget);
    expect(find.text('UI theme foundation is ready.'), findsOneWidget);
  });
}
