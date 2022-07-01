import 'dart:collection';

import 'package:flutter/material.dart';

typedef TagBuilder<C, R> = R Function(C child, LinkedHashMap<Object, String> attributes);

/// C : type of Child
/// R : type of builder result
abstract class VividTag<C, R> {
  VividTag({required this.name, required this.builder});
  final String name;

  final TagBuilder<C, R> builder;
}

class VividTextTag extends VividTag<String, TextSpan> {
  VividTextTag({required String name, required TagBuilder<String, TextSpan> builder})
      : super(name: name, builder: builder);
}

class VividWidgetTag extends VividTag<List<Widget>, Widget> {
  VividWidgetTag({required String name, required TagBuilder<List<Widget>, Widget> builder})
      : super(name: name, builder: builder);
}
