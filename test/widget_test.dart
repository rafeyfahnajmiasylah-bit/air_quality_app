
import 'package:flutter_test/flutter_test.dart';
import 'package:air_quality_app/main.dart';

void main() {
  testWidgets('Air Quality app starts successfully',
      (WidgetTester tester) async {
    await tester.pumpWidget(const AirQualityApp());

    expect(find.text('Air Quality Monitor'), findsOneWidget);
  });
}
