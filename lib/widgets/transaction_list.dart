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
    return LayoutBuilder(builder: (context, constraints) {
      return userTransactions.isEmpty
          ? Column(
              children: [
                Container(
                  height: constraints.maxHeight * 0.1,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: FittedBox(
                    child: Text(
                      'No Transactions added yet!!!',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ),
                Container(
                  height: constraints.maxHeight * 0.7,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : SizedBox(
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
    });
  }
}
