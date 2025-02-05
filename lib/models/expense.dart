// `Expense` class: Represents a single expense with properties like
//     title, amount, date, category, and a unique ID.
//  - `Category` enum: Defines different expense categories (food, travel, etc.).
//   - `ExpenseBucket` class: Groups expenses by category and calculates
//     the total expenses for each category.
//
// This code provides a foundation for building features like:
//   - Adding, editing, and deleting expenses.
//   - Displaying expenses in a list or chart.
//   - Filtering expenses by category or date.
//   - Analyzing spending trends.

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

//decide content of a single list item

final formatter = DateFormat.yMd();
const uuid = Uuid();

enum Category { food, travel, leisure, work }

const categoryItem = {
  Category.food: Icons.dining,
  Category.travel: Icons.flight,
  Category.work: Icons.work,
  Category.leisure: Icons.movie_filter,
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4(); //assign unique id

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formatedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({
    required this.category,
    required this.expenses,
  });

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;

    for (final expense in expenses) {
      sum += expense.amount;
    }

    return sum;
  }
}
