import 'package:exp_track/models/expenses.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.save});
  final Function(ExpenseItem item) save;
  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  String _enteredTitle = '';
  double _enteredPrice = 0;
  DateTime? _selectedDate;
  Category _selectedCategory = Category.food;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  void _showDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);

    final pickedDate = await showDatePicker(
        context: context, firstDate: firstDate, lastDate: now);
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void showMyAlertDialog({required String title, required String content}) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Okay'),
          ),
        ],
      ),
    );
  }

  bool validation() {
    if (_titleController.text.trim().isEmpty ||
        _priceController.text.trim().isEmpty) {
      showMyAlertDialog(
          title: 'Invalid Input', content: 'Please fill all required cells');
      return false;
    }

    if (_selectedDate == null) {
      showMyAlertDialog(
          title: 'Invalid Input', content: 'Please Select expense date');
      return false;
    }
    return true;
  }

  void _save() {
    if (validation() == true) {
      _enteredTitle = _titleController.text;
      _enteredPrice = double.parse(_priceController.text);

      widget.save(ExpenseItem(
          title: _enteredTitle,
          price: _enteredPrice,
          date: _selectedDate!,
          category: _selectedCategory));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Expense Added'),
        ),
      );
    }
  }

  void _rest() {
    _enteredTitle = '';
    _enteredPrice = 0;
    _titleController.text = '';
    _priceController.text = '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _priceController,
                  decoration: const InputDecoration(
                    label: Text('Amount'),
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(_selectedDate == null
                      ? 'No Date Selected '
                      : formatter.format(_selectedDate!)),
                  IconButton(
                    onPressed: _showDatePicker,
                    icon: const Icon(Icons.calendar_month),
                  ),
                ],
              ))
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                items: Category.values
                    .map((category) => DropdownMenuItem(
                        value: category,
                        child: Text(category.name.toUpperCase())))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value!;
                  });
                },
              ),
              const Spacer(),
              TextButton(
                onPressed: _rest,
                child: const Text('Reset'),
              ),
              ElevatedButton(
                onPressed: _save,
                child: const Text('Save'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
