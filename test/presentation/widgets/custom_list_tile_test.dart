import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/presentation/widgets/custom_list_tile.dart';

void main() {
  Widget _makeTestableWidget(Widget body) {
    return MaterialApp(
      home: Scaffold(body: body),
    );
  }

  testWidgets('custom list tile ...', (tester) async {
    const key = Key('Custom List Tile');

    await tester.pumpWidget(_makeTestableWidget(const CustomListTile(
      text: 'SSE',
      first: 'Speed: ',
      second: '22.0 km/h',
      icon: Icons.air,
      iconColor: Colors.blue,
      key: key,
    )));

    // Custom List Tile
    expect(find.byKey(key), findsOneWidget);
    expect(find.text('SSE'), findsOneWidget);
    // expect(find.text('Speed: ', findRichText: true), findsOneWidget);
    // expect(find.text('22.0 km/h', findRichText: true), findsOneWidget);
  });
}
