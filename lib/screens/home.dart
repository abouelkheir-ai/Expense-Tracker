import 'package:exp_track/dummy/dummy_data.dart';
import 'package:exp_track/models/expenses.dart';
import 'package:exp_track/widgets/exp_list.dart';
import 'package:exp_track/widgets/new_exp.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _openBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) =>  NewExpense(
        save: _save,
      ),
    );
  }

  void _save(ExpenseItem item) {
    setState(() {
      dummyData.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Expense Tracker'),
        actions: [
          IconButton(onPressed: _openBottomSheet, icon: const Icon(Icons.add))
        ],
      ),
      body: ExpList(
        expenses: dummyData,
      ),
    );
  }
}
