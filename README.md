# vivid_text

A great solution for generating "mixed typesetting of text and widget" based on text.

## Example

```dart
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
```
```dart
final logs = [
    '<user userid="1" name="keysking"></user> created this library <hoursToNow time="1656589103000"></hoursToNow> hours ago',
    '<user userid="2" name="Jobs"></user> <star></star> this library <hoursToNow time="1656589103000"></hoursToNow> hours ago',
    '<user userid="1" name="keysking"></user> created this library <hoursToNow time="1656589103000"></hoursToNow> hours ago',
];
```

```dart
VividText(logs[index], tags: tags, style: const TextStyle(fontSize: 18))
```
<div align=center>
<img width="350"  src="https://github.com/keysking/flutter_vivid_text/blob/main/doc/img/example.gif?raw=true"/>
</div>