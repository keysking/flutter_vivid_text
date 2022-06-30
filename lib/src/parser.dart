import 'package:flutter/material.dart';
import 'package:html/dom.dart' as html;
import 'package:html/parser.dart' show parse;

import 'tag.dart';

InlineSpan defaultSpanBuilder(html.Node node) {
  return TextSpan(text: node.text, style: const TextStyle(color: Colors.red));
}

List<InlineSpan> parseToSpan(String text, Map<String, SuperTag> tagMap) {
  final result = <InlineSpan>[];
  final nodes = parse(text).body!.nodes;
  for (var node in nodes) {
    if (node.nodeType == html.Node.TEXT_NODE) {
      result.add(TextSpan(text: node.text));
    } else if (node.nodeType == html.Node.ELEMENT_NODE) {
      final element = node as html.Element;
      final name = element.localName;
      final tag = tagMap[name];
      if (tag is SuperWidgetTag) {
        // TODO child
        result.add(WidgetSpan(child: tag.builder([], element.attributes)));
      } else if (tag is SuperTextTag) {
        result.add(tag.builder(node.innerHtml, element.attributes));
      } else {
        result.add(defaultSpanBuilder(node));
      }
    } else {
      result.add(defaultSpanBuilder(node));
    }
  }
  return result;
}
