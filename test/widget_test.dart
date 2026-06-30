import 'package:flutter_test/flutter_test.dart';

import 'package:jin_xiao_cun_2026/app/app.dart';

void main() {
  testWidgets('app starts with shared theme', (WidgetTester tester) async {
    await tester.pumpWidget(const JinXiaoCunApp());

    expect(find.text('首页'), findsOneWidget);
    expect(find.text('基础界面已就绪'), findsOneWidget);
  });
}
