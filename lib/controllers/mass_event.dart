part of 'mass_conversion_stream.dart';

class MassEvent {}

class UnitChanged extends MassEvent {
  final MASS unitA, unitB;

  UnitChanged({this.unitA = MASS.kilograms, this.unitB = MASS.grams});
}

class MassInputTargetChanged extends MassEvent {
  final InputPos inputPos;
  MassInputTargetChanged({this.inputPos = InputPos.massA});
}

class InsertNumber extends MassEvent {
  final int number;
  InsertNumber({this.number = 0});
}

class BackspaceNumber extends MassEvent {}

class ClearNumberInput extends MassEvent {}
