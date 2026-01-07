import 'package:flutter/material.dart';
import 'package:flutter_shortable_table_view/sortable_column.dart';
import 'package:flutter_shortable_table_view/sortable_table_view.dart';


class User {
  final String name;
  final int age;

  User(this.name, this.age);
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final users = [
      User('Riya', 24),
      User('Rahul', 22),
      User('Amit', 26),
      User('Mohan', 30),
      User('Ronak', 28),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Sortable TableView')),
        body: SortableTableView<User>(
          data: users,
          columns: [
            SortableColumn<User>(
              title: 'Name',
              cellBuilder: (u) => Text(u.name),
              sort: (a, b) => a.name.compareTo(b.name),
            ),
            SortableColumn<User>(
              title: 'Age',
              cellBuilder: (u) => Text('${u.age}'),
              sort: (a, b) => a.age.compareTo(b.age),
            ),
          ],
        ),
      ),
    );
  }
}
