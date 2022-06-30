import 'package:flutter/material.dart';
import 'package:super_text/src/parser.dart';

class SuperText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  const SuperText(this.text, {Key? key, this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final spans = parseToSpan(text);
    return Text.rich(
      TextSpan(
        style: style,
        children: spans,
      ),
    );
  }
}
