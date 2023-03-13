import 'package:flutter/material.dart';
import 'package:weight_converter_app/components/num_keyboard.dart';
import 'package:weight_converter_app/components/unit_conversion_widget.dart';

class WeightConverterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final txtTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.scale),
        title: Text(
          'Mass Conversion',
          style: txtTheme.titleSmall,
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(flex: 5, child: UnitConversionWidget()),
          Expanded(flex: 6, child: NumKeyboard()),
        ],
      ),
    );
  }
}
