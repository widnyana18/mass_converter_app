import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:units_converter/properties/mass.dart';
import 'package:weight_converter_app/controllers/mass_conversion_stream.dart';

@GenerateNiceMocks([MockSpec<MassConversionStream>()])
import 'bloc_test.mocks.dart';

void main() {
  test('Testing Unit Changed', () {
    // final mass = Mass();
    final stream = MockMassConversionStream();

    // stream.event.add(UnitChanged(unitA: MASS.ounces, unitB: MASS.pennyweights));
    // verify(stream.event);

    // stream.state.listen((snap) {
    //   snap.massA!.stringValue;
    // });
    // final currentEvent = stream.eventStream;
    // verify(currentEvent);
    final state = stream.state.value.massA!.name;
    when(state).thenReturn(state);
    expect(state, equals(MASS.kilograms.name));
  });
}
