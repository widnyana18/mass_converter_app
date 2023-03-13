part of 'mass_conversion_stream.dart';

class MassModel {
  final String? name, symbol, value;
  MassModel({this.name, this.symbol, this.value});
}

class MassState {
  final MassModel? massA, massB;
  MassState({this.massA, this.massB});

  factory MassState.initial() {
    return MassState(
      massA: MassModel(name: 'Killograms', symbol: 'kg', value: '0'),
      massB: MassModel(name: 'Grams', symbol: 'g', value: '0'),
    );
  }
}

class MassProps {
  MassProps({
    this.units,
    this.inputTarget,
    this.number,
  });

  final UnitChanged? units;
  final InputPos? inputTarget;
  final double? number;
}
