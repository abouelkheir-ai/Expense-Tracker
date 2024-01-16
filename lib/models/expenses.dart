// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:uuid/uuid.dart';

// final uuid = Uuid();
// final formatter = DateFormat.yMd();

// enum Category { food, travel, leisure, work }

// const categoryIcons = {
//   Category.food: Icons.lunch_dining,
//   Category.travel: Icons.flight_takeoff,
//   Category.leisure: Icons.movie,
//   Category.work: Icons.work,
// };

// class Expenses {
//   Expenses(
//       {required this.title,
//       required this.amount,
//       required this.date,
//       required this.category})
//       : id = uuid.v4();

//   final String id;
//   final String title;
//   final double amount;
//   final DateTime date;
//   final Category category;

//   String get formattedDate {
//     return formatter.format(date);
//   }
// }
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum Category { travel, food, leisure, work }

final formatter = DateFormat.yMd();
const CategoryIcon = {
  Category.travel: Icons.flight_takeoff,
  Category.food: Icons.lunch_dining,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

class ExpenseItem {
  final String title;
  final double price;
  final DateTime date;
  final Category category;

  const ExpenseItem({
    required this.title,
    required this.price,
    required this.date,
    required this.category,
  });
  String getFormatter() {
    return formatter.format(date);
  }
}
