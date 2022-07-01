import 'package:flutter/material.dart';
import 'package:vivid_text/vivid_text.dart';
import 'package:vivid_text_example/user_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<VividTag> tags = [
      VividWidgetTag(
        name: 'user',
        builder: ((child, attributes) {
          final name = attributes['name'];
          return TextButton(
              onPressed: () {
                final user = getUserApi(int.parse(attributes['userid'] ?? '0'));
                Navigator.push(context, MaterialPageRoute(builder: (c) => UserPage(user)));
              },
              child: Text('$name', style: const TextStyle(fontSize: 18)));
        }),
      ),
      VividWidgetTag(
        name: 'star',
        builder: ((child, attributes) {
          return Icon(Icons.star, color: Colors.yellow[700]);
        }),
      ),
      VividTextTag(
        name: 'hoursToNow',
        builder: ((child, attributes) {
          final time = DateTime.fromMillisecondsSinceEpoch(int.parse(attributes['time']!));
          final diff = DateTime.now().difference(time);
          return TextSpan(text: '${diff.inHours}');
        }),
      ),
    ];
    final logs = [
      '<user userid="1" name="keysking"></user> created this library <hoursToNow time="1656589103000"></hoursToNow> hours ago',
      '<user userid="2" name="Jobs"></user> <star></star> this library <hoursToNow time="1656589103000"></hoursToNow> hours ago',
      '<user userid="1" name="keysking"></user> created this library <hoursToNow time="1656589103000"></hoursToNow> hours ago',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('vivid_text Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Logs:", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView.builder(
                itemCount: logs.length,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        // This line is important.
                        child: VividText(logs[index], tags: tags, style: const TextStyle(fontSize: 18)),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
