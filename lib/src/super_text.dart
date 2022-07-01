import 'package:flutter/material.dart';
import 'package:supertext/src/parser.dart';

import 'tag.dart';

class SuperText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final List<SuperTag> tags;
  const SuperText(this.text, {Key? key, this.style, this.tags = const []}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final map = <String, SuperTag>{};
    for (final tag in tags) {
      map[tag.name.toLowerCase()] = tag;
    }
    final spans = parseToSpan(text, map);

    return Text.rich(
      TextSpan(
        style: style,
        children: spans,
      ),
    );
  }
}
