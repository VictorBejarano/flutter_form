import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_form/app.dart';

void main() {
  testWidgets('La aplicación se renderiza correctamente',
      (WidgetTester tester) async {
    // Renderiza la aplicación
    await tester.pumpWidget(const App());

    // Verifica si el widget raíz de la aplicación está presente
    expect(find.byType(App), findsOneWidget);
  });
}
