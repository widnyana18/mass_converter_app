import 'package:flutter/material.dart';
import 'package:weight_converter_app/utils/app_theme.dart';
import 'package:weight_converter_app/views/weight_converter_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mass Conversion',
      theme: AppTheme.light,
      home: WeightConverterView(),
    );
  }
}
