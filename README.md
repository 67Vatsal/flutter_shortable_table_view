## 📊 Sortable TableView for Flutter
```
A lightweight, customizable, and fully generic sortable table view widget for Flutter.
Easily display tabular data with click-to-sort columns, clean UI, and zero third-party dependencies.
```
## ✨ Features
```
✅ Generic type support (<T>)
✅ Column-based sorting (ascending / descending)
✅ Custom cell widgets
✅ Material-friendly UI
✅ Lightweight & fast
✅ No external dependencies
✅ Ideal for dashboards, admin panels & reports
```
## 📸 Preview

https://github.com/user-attachments/assets/a6f370ce-08d3-4044-a91f-953fa51a898f

## 📦 Installation
Add this to your pubspec.yaml:
```
dependencies:
  sortable_tableview: ^1.0.0
```
Then run:
```
flutter pub get
```
## 🚀 Basic Usage

Define Your Model : 
```
class User {
  final String name;
  final int age;

  User(this.name, this.age);
}
```
## Use SortableTableView
```
SortableTableView<User>(
  data: users,
  columns: [
    SortableColumn<User>(
      title: 'Name',
      cellBuilder: (user) => Text(user.name),
      sort: (a, b) => a.name.compareTo(b.name),
    ),
    SortableColumn<User>(
      title: 'Age',
      cellBuilder: (user) => Text('${user.age}'),
      sort: (a, b) => a.age.compareTo(b.age),
    ),
  ],
);
```
## 🧠 Best Use Cases
```
✔ Admin dashboards
✔ Analytics screens
✔ Report views
✔ CRM / ERP apps
✔ Internal tools
```

## 📄 License
```
MIT License

Copyright (c) 2025 Excelsior Technologies

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
```
