import 'package:flutter/material.dart';
import 'package:super_text/super_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<SuperTag> tags = [
      SuperTextTag(
        name: 'a',
        builder: ((child, attributes) {
          return const TextSpan(text: '牛啊', style: TextStyle(fontSize: 30));
        }),
      ),
      SuperWidgetTag(
        name: 'img',
        builder: ((child, attributes) {
          final src = attributes['src'];
          if (src == null) {
            return const SizedBox();
          }
          return Image.network(src, width: 100, height: 100);
        }),
      ),
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: SuperText(
            'Running!!<a>123</a><b>bbb</b><img src="https://img.yzcdn.cn/vant/logo.png">123</img><a>123</a>',
            tags: tags,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
