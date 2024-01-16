import 'package:flutter/material.dart';

class ExpenseListProvier extends ChangeNotifier {
  final List<String> _items = ['title','title2'];
  void addItem(String item) {
    _items.add(item);
    notifyListeners();
  }

  get getItemCount => _items.length;
  get getListItem => _items;
}
