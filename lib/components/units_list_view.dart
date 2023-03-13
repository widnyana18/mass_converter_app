import 'package:flutter/material.dart';
import 'package:units_converter/units_converter.dart';

class UnitsListView extends StatelessWidget {
  final ValueKey<int> valKey;
  const UnitsListView(this.valKey) : super(key: valKey);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final txtTheme = theme.textTheme;
    final mass = Mass();
    final massData = mass.mapSymbols?.entries;

    return Padding(
      padding: EdgeInsets.all(22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Select Unit',
            textAlign: TextAlign.center,
            style: txtTheme.titleMedium,
          ),
          Expanded(
            child: ListView(
              key: valKey,
              padding: EdgeInsets.zero,
              physics: BouncingScrollPhysics(),
              children: massData!.map((unit) {
                final massName = unit.key.name;
                final massSymbol = unit.value;

                return ListTile(
                  title: Text(
                    '$massName $massSymbol',
                    style: txtTheme.bodyMedium,
                  ),
                  onTap: () {
                    if (valKey.value == 1) {
                    } else {}
                  },
                );
              }).toList(),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Cancel',
              style: txtTheme.titleSmall,
            ),
            style: TextButton.styleFrom(
                shape: StadiumBorder(), backgroundColor: theme.canvasColor),
          )
        ],
      ),
    );
  }
}
