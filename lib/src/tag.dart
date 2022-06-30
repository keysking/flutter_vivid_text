import 'dart:collection';

import 'package:flutter/material.dart';

typedef TagBuilder<C, R> = R Function(C child, LinkedHashMap<Object, String> attributes);

/// C : type of Child
/// R : type of builder result
abstract class SuperTag<C, R> {
  SuperTag({required this.name, required this.builder});
  final String name;

  final TagBuilder<C, R> builder;
}

class SuperTextTag extends SuperTag<String, TextSpan> {
  SuperTextTag({required String name, required TagBuilder<String, TextSpan> builder})
      : super(name: name, builder: builder);
}

class SuperWidgetTag extends SuperTag<List<Widget>, Widget> {
  SuperWidgetTag({required String name, required TagBuilder<List<Widget>, Widget> builder})
      : super(name: name, builder: builder);
}
