import 'package:first_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;
  final Function deleteTransaction;
  const TransactionItem(
      {Key? key, required this.deleteTransaction, required this.transaction})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text('\$${transaction.amount.toStringAsFixed(2)}'),
            ),
          ),
        ),
        title: Text(
          transaction.name,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        subtitle: Text(DateFormat.yMMMd().format(transaction.time)),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          color: Theme.of(context).errorColor,
          onPressed: () => deleteTransaction(transaction.id),
        ),
      ),
    );
    // return Card(
    //   elevation: 5,
    //   child: Container(
    //     child: Row(
    //       children: [
    //         Container(
    //           child: Text(
    //             '\$${transaction.amount.toStringAsFixed(2)}',
    //             style: TextStyle(
    //               fontSize: 20,
    //               fontWeight: FontWeight.bold,
    //               color: Theme.of(context).primaryColorDark,
    //             ),
    //             textAlign: TextAlign.right,
    //           ),
    //           decoration: BoxDecoration(
    //             border: Border.all(
    //               color: Theme.of(context).primaryColor,
    //               width: 2,
    //             ),
    //           ),
    //           width: 80,
    //           padding: const EdgeInsets.symmetric(
    //             horizontal: 5,
    //             vertical: 10,
    //           ),
    //           margin: const EdgeInsets.symmetric(horizontal: 15),
    //         ),
    //         Container(
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Text(
    //                 transaction.name,
    //                 style: Theme.of(context).textTheme.bodyText1,
    //               ),
    //               Text(
    //                 DateFormat('yMMMd').format(transaction.time),
    //                 style: const TextStyle(color: Colors.grey),
    //               )
    //             ],
    //           ),
    //           margin: const EdgeInsets.symmetric(horizontal: 15),
    //         )
    //       ],
    //     ),
    //     padding: const EdgeInsets.symmetric(vertical: 10),
    //   ),
    // );
  }
}
