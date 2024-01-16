import 'package:exp_track/models/expenses.dart';
import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  const CardItem({super.key, required this.item});
  final ExpenseItem item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.title),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text("\$ ${item.price.toStringAsFixed(2)}"),
                const Spacer(),
                Icon(CategoryIcon[item.category]),
                const SizedBox(
                  width: 8,
                ),
                Text(item.getFormatter()),
              ],
            ),
            // Text(item.title),
          ],
        ),
      ),
    );
  }
}
