import 'package:first_app/models/transaction.dart';
import 'package:first_app/widgets/new_transaction.dart';
import 'package:first_app/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

class TransactionsWidget extends StatefulWidget {
  const TransactionsWidget({Key? key}) : super(key: key);

  @override
  _TransactionsWidgetState createState() => _TransactionsWidgetState();
}

final List<Transaction> _userTransactions = [
  Transaction(id: '12', name: 'Shoes', amount: 69.99, time: DateTime.now()),
  Transaction(id: '22', name: 'Socks', amount: 19.99, time: DateTime.now()),
  Transaction(id: '31', name: 'Legs', amount: 99.99, time: DateTime.now()),
];

class _TransactionsWidgetState extends State<TransactionsWidget> {
  void addTransaction(Transaction transaction) {
    setState(() {
      _userTransactions.add(transaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(addTransaction),
        TransactionList(userTransactions: _userTransactions),
      ],
    );
  }
}
