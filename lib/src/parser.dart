import 'package:flutter/material.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';

List<InlineSpan> parseToSpan(String text) {
  final result = <InlineSpan>[];
  final nodes = parse(text).body!.nodes;
  for (var node in nodes) {
    if (node.nodeType == Node.TEXT_NODE) {
      result.add(TextSpan(text: node.text));
    } else {
      result.add(TextSpan(text: node.text, style: const TextStyle(color: Colors.red)));
    }
  }
  return result;
}
