import 'package:flutter_test/flutter_test.dart';
import 'package:kheper/main.dart';

void main() {
  testWidgets('shows the offline paired-script foundation', (tester) async {
    await tester.pumpWidget(const KheperApp());

    expect(find.text('Kheper'), findsOneWidget);
    expect(find.text('Learn Middle Egyptian scripts'), findsOneWidget);
    expect(find.text('Monumental hieroglyphs'), findsOneWidget);
    expect(find.text('Hieratic'), findsOneWidget);
    expect(find.text('Offline by design'), findsOneWidget);
  });

  testWidgets('exposes foundation content to accessibility services', (
    tester,
  ) async {
    final semantics = tester.ensureSemantics();

    await tester.pumpWidget(const KheperApp());

    expect(
      find.bySemanticsLabel('Learn Middle Egyptian scripts'),
      findsOneWidget,
    );
    expect(find.bySemanticsLabel('Offline by design'), findsOneWidget);
    await tester.scrollUntilVisible(
      find.text('No account, telemetry, or runtime network access'),
      200,
    );
    await tester.pump();
    final privacySemantics = tester.getSemantics(
      find.text('No account, telemetry, or runtime network access'),
    );
    expect(
      privacySemantics.label,
      contains('No account, telemetry, or runtime network access'),
    );
    semantics.dispose();
  });
}
