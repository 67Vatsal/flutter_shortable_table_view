import 'package:flutter/cupertino.dart';

typedef SortCallback<T> = int Function(T a, T b);

class SortableColumn<T> {
  final String title;
  final double? width;
  final Widget Function(T item) cellBuilder;
  final SortCallback<T>? sort;

  SortableColumn({
    required this.title,
    required this.cellBuilder,
    this.sort,
    this.width,
  });
}
