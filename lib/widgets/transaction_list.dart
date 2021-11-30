import 'package:first_app/models/transaction.dart';
import 'package:first_app/widgets/transaction_item.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;

  const TransactionList({Key? key, required this.userTransactions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: userTransactions
          .map((transaction) => TransactionItem(transaction))
          .toList(),
    );
  }
}
