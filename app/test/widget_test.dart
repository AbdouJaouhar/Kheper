import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kheper/main.dart';

void main() {
  testWidgets('navigates between the five phone destinations', (tester) async {
    await tester.binding.setSurfaceSize(const Size(430, 932));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(const KheperApp());

    expect(find.byType(NavigationBar), findsOneWidget);
    expect(find.text(AppCopy.english.learnLabel), findsOneWidget);
    expect(find.text(AppCopy.english.reviewLabel), findsOneWidget);
    expect(find.text(AppCopy.english.signsLabel), findsOneWidget);
    expect(find.text(AppCopy.english.readLabel), findsOneWidget);
    expect(find.text(AppCopy.english.settingsLabel), findsOneWidget);
    expect(find.text(AppCopy.english.learnTitle), findsOneWidget);

    await tester.tap(find.text(AppCopy.english.reviewLabel));
    await tester.pumpAndSettle();

    expect(find.text(AppCopy.english.reviewTitle), findsNWidgets(2));
    expect(find.text(AppCopy.english.reviewBody), findsOneWidget);
  });

  testWidgets('uses a navigation rail on a wide layout', (tester) async {
    await tester.binding.setSurfaceSize(const Size(900, 800));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(const KheperApp());

    expect(find.byType(NavigationRail), findsOneWidget);
    expect(find.byType(NavigationBar), findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets('French expansion fixture fits the minimum width', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(320, 720));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(
      const KheperApp(copy: AppCopy.frenchExpansionFixture),
    );

    expect(
      find.text(AppCopy.frenchExpansionFixture.learnTitle),
      findsOneWidget,
    );
    expect(find.byType(NavigationBar), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('keeps Arabic UI and inscription directions independent', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(320, 720));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(
      const KheperApp(
        copy: AppCopy.arabicFixture,
        uiTextDirection: TextDirection.rtl,
        inscriptionTextDirection: TextDirection.ltr,
      ),
    );

    final uiDirection = tester.widget<Directionality>(
      find.byKey(const ValueKey('ui-direction')),
    );
    expect(uiDirection.textDirection, TextDirection.rtl);

    await tester.tap(find.text(AppCopy.arabicFixture.readLabel));
    await tester.pumpAndSettle();

    final inscriptionDirection = tester.widget<Directionality>(
      find.byKey(const ValueKey('inscription-direction')),
    );
    expect(inscriptionDirection.textDirection, TextDirection.ltr);
    expect(tester.takeException(), isNull);
  });

  testWidgets('exposes shell content to accessibility services', (
    tester,
  ) async {
    final semantics = tester.ensureSemantics();

    await tester.pumpWidget(const KheperApp());

    expect(find.bySemanticsLabel(AppCopy.english.learnTitle), findsOneWidget);
    expect(
      find.bySemanticsLabel(AppCopy.english.offlineStatus),
      findsOneWidget,
    );

    semantics.dispose();
  });
}
