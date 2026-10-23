import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_2025/main.dart';

void main() {
  testWidgets('Registration page smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const TokoTegarApp());

    // Verify that the registration page is shown.
    expect(find.text('Registrasi Pemilik Toko'), findsOneWidget);
    expect(find.text('Nama Toko'), findsOneWidget);
    expect(find.text('Submit'), findsOneWidget);
  });
}

