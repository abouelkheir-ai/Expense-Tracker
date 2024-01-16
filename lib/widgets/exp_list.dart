import 'package:exp_track/models/expenses.dart';
import 'package:exp_track/widgets/card_item.dart';
import 'package:flutter/material.dart';

class ExpList extends StatefulWidget {
  const ExpList({super.key, required this.expenses});
  final List<ExpenseItem> expenses;

  @override
  State<ExpList> createState() => _ExpListState();
}

class _ExpListState extends State<ExpList> {
  bool isEmpty = false;
  @override
  Widget build(BuildContext context) {
    return widget.expenses.isEmpty
        ? const Center(
            child: Text('No Expense To Track'),
          )
        : ListView.builder(
            itemCount: widget.expenses.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                key: ValueKey(widget.expenses[index]),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  setState(() {
                    widget.expenses.removeAt(index);
                  });

                  if (widget.expenses.isEmpty) {
                    // Set a state flag to rebuild the widget if needed
                  }
                },
                background: Container(
                  alignment: AlignmentDirectional.centerEnd,
                  color: Colors.red,
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                ),
                child: CardItem(
                  item: widget.expenses[index],
                ),
              );
            },
          );
  }
}
