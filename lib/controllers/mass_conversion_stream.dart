import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:units_converter/units_converter.dart';
import 'package:weight_converter_app/utils/number_formater.dart';

part 'mass_event.dart';
part 'mass_state.dart';

class MassConversionStream {
  MassConversionStream() {
    _calculateMass();
    _mapEventToState();
  }

  final _mass = Mass(significantFigures: 9);
  final BehaviorSubject<MassEvent> _eventController =
      BehaviorSubject.seeded(MassEvent());
  final BehaviorSubject<MassState> _stateController =
      BehaviorSubject.seeded(MassState.initial());
  final BehaviorSubject<double> _inputController = BehaviorSubject.seeded(0);
  final BehaviorSubject<UnitChanged> _unitController =
      BehaviorSubject.seeded(UnitChanged());
  final BehaviorSubject<InputPos> _inputTargetController =
      BehaviorSubject.seeded(InputPos.massA);

  StreamSink<MassEvent> get event => _eventController;
  ValueStream<MassEvent> get eventStream => _eventController.stream;
  ValueStream<MassState> get state => _stateController.stream;

  void _mapEventToState() {
    try {
      _eventController.listen((event) {
        if (event is UnitChanged) {
          _unitController.add(event);
        } else if (event is MassInputTargetChanged) {
          _inputTargetController.add(event.inputPos);
        } else if (event is InsertNumber) {
          _addNumber(event.number);
        } else if (event is BackspaceNumber) {
          _eraseNumber();
        } else {
          _inputController.add(0);
        }
      });
    } on Exception catch (e) {
      throw e.toString();
    }
  }

  void _calculateMass() {
    try {
          double i = 22.2;
      Rx.combineLatest3(
        _unitController.stream,
        _inputTargetController.stream,
        _inputController.stream,
        (UnitChanged a, InputPos b, double c) =>
            MassProps(units: a, inputTarget: b, number: c),
      ).listen((event) {
        final massA = _mass.getUnit(event.units!.unitA);
        final massB = _mass.getUnit(event.units!.unitB);        
        final massData = MassState(massA: MassModel(name: massA.name, symbol: massA.symbol,value: ), massB: massB)

        if (event.inputTarget == InputPos.massA) {
          formatInputVal(newNum)
          _mass.convert(event.units!.unitA, event.number);
        } else {
          _mass.convert(event.units!.unitB, event.number);
        }

        _stateController.add(massData);
      });
    } on Exception catch (e) {
      throw e.toString();
    }
  }

  void _addNumber(int number) {
    _inputController.listen((value) {      
      final newNum = validateStringInput(inputVal: value, newNum:  number);
      _inputController.add(newNum);
    });
  }

  void _eraseNumber() {
    final stringInput = _inputController.listen((value) {}).toString();
    final lastIdx = stringInput.length - 1;
    final newString = stringInput.substring(0, lastIdx);
    final numVal = double.parse(newString);
    _inputController.add(numVal);
  }

  Future<void> dispose() async {
    await Future.wait([
      _eventController.close(),
      _stateController.close(),
      _inputController.close(),
      _inputTargetController.close(),
      _unitController.close(),
    ]);
  }
}

enum InputPos {
  massA,
  massB;
}
