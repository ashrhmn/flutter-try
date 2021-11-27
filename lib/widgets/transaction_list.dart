import 'package:first_app/models/transaction.dart';
import 'package:first_app/widgets/transaction_item.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatefulWidget {
  const TransactionList({Key? key}) : super(key: key);

  @override
  _TransactionListState createState() => _TransactionListState();
}

final List<Transaction> _userTransactions = [
  Transaction(id: '12', name: 'Shoes', amount: 69.99, time: DateTime.now()),
  Transaction(id: '22', name: 'Socks', amount: 19.99, time: DateTime.now()),
  Transaction(id: '31', name: 'Legs', amount: 99.99, time: DateTime.now()),
];

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: _userTransactions
            .map((transaction) => TransactionItem(transaction))
            .toList());
  }
}
