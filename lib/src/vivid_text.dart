import 'package:flutter/material.dart';
import 'package:vivid_text/src/parser.dart';

import 'tag.dart';

class VividText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final List<VividTag> tags;
  const VividText(this.text, {Key? key, this.style, this.tags = const []}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final map = <String, VividTag>{};
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
