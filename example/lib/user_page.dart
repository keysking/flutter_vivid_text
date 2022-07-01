import 'package:flutter/material.dart';

class User {
  final int id;
  final String name;
  final int gender;
  final String number;

  User(this.id, this.name, this.gender, this.number);
}

/// mock get user api
User getUserApi(int id) {
  if (id == 1) {
    return User(1, 'ksyeking', 1, '123xxxx8888');
  }
  return User(1000, 'Jobs', 2, '123xxxx2333');
}

class UserPage extends StatelessWidget {
  final User user;
  const UserPage(this.user, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${user.name}'s Profile")),
      body: Center(
        child: Card(
          child: SizedBox(
            width: 300,
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('User Card'),
                Row(
                  children: [
                    Icon(
                      Icons.person,
                      size: 100,
                      color: user.gender == 1 ? Colors.blue : Colors.red,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('id: ${user.id}'),
                        Text('name: ${user.name}'),
                        Text('number: ${user.number}'),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
