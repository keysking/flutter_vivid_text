# supertext

A great solution for generating "mixed typesetting of text and widget" based on text.

## Example

```dart
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Specify the mapping between tag and Widget.
    final List<SuperTag> tags = [
      SuperWidgetTag(
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
      SuperWidgetTag(
        name: 'star',
        builder: ((child, attributes) {
          return Icon(Icons.star, color: Colors.yellow[700]);
        }),
      ),
      SuperTextTag(
        name: 'hoursToNow',
        builder: ((child, attributes) {
          final time = DateTime.fromMillisecondsSinceEpoch(int.parse(attributes['time']!));
          return TextSpan(text: '${time.hour}');
        }),
      ),
    ];
    // Text: usually comes from the database or back end.
    final logs = [
      '<user userid="1" name="keysking"></user> created this library <hoursToNow time="1656589103"></hoursToNow> hours ago',
      '<user userid="2" name="Jobs"></user> <star></star> this library <hoursToNow time="1656589103"></hoursToNow> hours ago',
      '<user userid="1" name="keysking"></user> created this library <hoursToNow time="1656589103"></hoursToNow> hours ago',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('super_text Demo'),
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
                        child: SuperText(logs[index], tags: tags, style: const TextStyle(fontSize: 18)),
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
```
<div align=center>
<img width="350"  src="https://github.com/keysking/flutter_super_text/blob/main/doc/img/example.gif?raw=true"/>
</div>