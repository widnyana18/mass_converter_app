import 'package:flutter/material.dart';
import 'package:weight_converter_app/components/units_list_view.dart';

class UnitConversionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          unitAndResult(context, 1),
          unitAndResult(context, 2),
        ],
      ),
    );
  }

  Widget unitAndResult(BuildContext context, int id) {
    final theme = Theme.of(context);
    final txtTheme = theme.textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Directionality(
          textDirection: TextDirection.rtl,
          child: TextButton.icon(
            onPressed: () {
              showModalBottomSheet(
                backgroundColor: theme.backgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                ),
                constraints: BoxConstraints.expand(
                    height: MediaQuery.of(context).size.height * 0.9),
                context: context,
                isScrollControlled: true,
                builder: (context) => UnitsListView(ValueKey(id)),
                enableDrag: false,
              );
            },
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Colors.black45,
            ),
            label: Text('mg', style: txtTheme.titleSmall),
            style: TextButton.styleFrom(backgroundColor: Colors.transparent),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '1.200.993',
                style: txtTheme.headlineSmall?.copyWith(color: Colors.black),
              ),
              Text('milligrams', style: txtTheme.bodySmall),
            ],
          ),
        ),
      ],
    );
  }
}
