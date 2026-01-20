import 'package:flutter/material.dart';
import 'sortable_column.dart';

class SortableTableView<T> extends StatefulWidget {
  final List<T> data;
  final List<SortableColumn<T>> columns;
  final double rowHeight;
  final Color? headerColor;

  const SortableTableView({
    super.key,
    required this.data,
    required this.columns,
    this.rowHeight = 48,
    this.headerColor,
  });

  @override
  State<SortableTableView<T>> createState() => _SortableTableViewState<T>();
}

class _SortableTableViewState<T> extends State<SortableTableView<T>> {
  int? _sortColumnIndex;
  bool _ascending = true;
  late List<T> _rows;

  @override
  void initState() {
    super.initState();
    _rows = List.from(widget.data);
  }

  void _onSort(int index) {
    final sortFn = widget.columns[index].sort;
    if (sortFn == null) return;

    setState(() {
      if (_sortColumnIndex == index) {
        _ascending = !_ascending;
      } else {
        _sortColumnIndex = index;
        _ascending = true;
      }

      _rows.sort((a, b) =>
      _ascending ? sortFn(a, b) : sortFn(b, a));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header
        Container(
          color: widget.headerColor ?? Theme.of(context).primaryColor,
          child: Row(
            children: List.generate(widget.columns.length, (index) {
              final column = widget.columns[index];
              return Expanded(
                flex: column.width?.toInt() ?? 1,
                child: InkWell(
                  onTap: () => _onSort(index),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Text(
                          column.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (_sortColumnIndex == index)
                          Icon(
                            _ascending
                                ? Icons.arrow_upward
                                : Icons.arrow_downward,
                            size: 16,
                            color: Colors.white,
                          )
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),

        // Rows
        ListView.builder(
          shrinkWrap: true,
          itemCount: _rows.length,
          itemBuilder: (_, rowIndex) {
            final item = _rows[rowIndex];
            return SizedBox(
              height: widget.rowHeight,
              child: Row(
                children: widget.columns.map((column) {
                  return Expanded(
                    flex: column.width?.toInt() ?? 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: column.cellBuilder(item),
                    ),
                  );
                }).toList(),
              ),
            );
          },
        ),
      ],
    );
  }
}
