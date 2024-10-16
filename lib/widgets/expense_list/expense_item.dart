import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

//single expesnse list item design display in card
class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          children: [
            Text(expense.title),
            const SizedBox(height: 4),
            Row(
              children: [
                Text('₹${expense.amount.toStringAsFixed(2)}'),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryItem[expense.category]),
                    const SizedBox(width: 4),
                    Text(expense.formatedDate),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
