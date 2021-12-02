import 'package:first_app/models/transaction.dart';
import 'package:first_app/widgets/transaction_item.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  final Function deleteTransaction;

  const TransactionList(
      {Key? key,
      required this.userTransactions,
      required this.deleteTransaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return userTransactions.isEmpty
        ? Column(
            children: [
              Text(
                'No Transaction',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 200,
                child: Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          )
        : SizedBox(
            height: 500,
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                return TransactionItem(
                  transaction: userTransactions[index],
                  deleteTransaction: deleteTransaction,
                );
              },
              itemCount: userTransactions.length,
            ),
          );
  }
}
