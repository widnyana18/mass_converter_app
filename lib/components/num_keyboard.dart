import 'package:flutter/material.dart';

class NumKeyboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Divider(
          color: theme.canvasColor,
          indent: 25,
          endIndent: 25,
          thickness: 1,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.fromLTRB(18, 15, 15, 18),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    numPad('7'),
                    numPad('4'),
                    numPad('1'),
                    numPad(''),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    numPad('8'),
                    numPad('5'),
                    numPad('2'),
                    numPad('0'),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    numPad('9'),
                    numPad('6'),
                    numPad('3'),
                    numPad(','),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: actPad(context, Text('AC'), DeleteMode.clear)),
                    SizedBox(height: 30),
                    Expanded(
                      child: actPad(context, Icon(Icons.backspace_outlined),
                          DeleteMode.erased),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget numPad(String num) => TextButton(
        child: Text(num),
        onPressed: () {},
      );

  Widget actPad(BuildContext context, Widget child, DeleteMode mode) {
    final theme = Theme.of(context);
    final txtTheme = theme.textTheme;

    return TextButton(
      onPressed: () {},
      child: child,
      style: TextButton.styleFrom(
        backgroundColor: theme.canvasColor,
        primary: theme.primaryColor,
        shape: StadiumBorder(),
        textStyle: txtTheme.titleLarge,
      ),
    );
  }
}

enum DeleteMode {
  erased,
  clear,
}
