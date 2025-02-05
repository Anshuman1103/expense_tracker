// This code defines a stateless widget, `ExpensesList`, responsible for displaying
// a list of expenses.
//
// It takes a list of `Expense` objects and a callback function (`onRemoveExpense`)
// as input.
//
// - It uses `ListView.builder` to efficiently render the list of expenses.
// - Each expense is displayed using the `ExpenseItem` widget.
// - A `Dismissible` widget allows users to swipe an expense to the left
//   to remove it from the list.
// - The `onRemoveExpense` callback is called when an expense is dismissed.

import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expense_list/expense_item.dart';
import 'package:flutter/material.dart';

//complete list of expenses item that is to be displayed
class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    //ListView.builder work same as recycler view
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        background: Container(
          color: Colors.red.shade600.withOpacity(0.75),
        ),
        key: ValueKey(expenses[index]),
        onDismissed: (direction) {
          onRemoveExpense(expenses[index]);
        },
        child: ExpenseItem(expenses[index]),
      ),
    );
  }
}
