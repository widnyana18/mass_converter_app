double validateStringInput({double? inputVal, int? newNum}) {
  const intRange = 15;
  const decRange = 20;
  final stringVal = inputVal.toString();

  if (stringVal.length <= intRange) {
    return double.parse('$inputVal$newNum');
  } else {
    return inputVal!;
  }
}

String formatsInputVal(double val) {
  return _formatThousandVal(val.toString());
}

String formatOutputVal(String outputVal) {
  final rawOutput = double.parse(outputVal);
  if (outputVal.length > 9) {
    return rawOutput.toStringAsExponential();
  }
  return outputVal;
}

String _formatThousandVal(String inputVal) {
  for (var idx = 1; idx <= inputVal.length; idx++) {
    if (idx % 3 == 1) {
      return inputVal.padLeft(2, '.');
    }
  }

  return inputVal;
}

bool _isDecimalNum(String val) {
  if (val.contains(',')) {
    return true;
  }
  return false;
}

String _purifyInputNumber(String val) {
  return val.replaceAll(RegExp(r'.'), '');
}
