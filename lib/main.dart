import 'package:flutter/material.dart';

import 'models/transaction.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';

void main() {
  runApp(const MyApp());
  // runApp(const ExpenseApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: 'QuickSand',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 20,
              ),
            ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const ExpenseApp(),
    );
  }
}

class ExpenseApp extends StatefulWidget {
  const ExpenseApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ExpenseAppState();
  }
}

class ExpenseAppState extends State<ExpenseApp> {
  final List<Transaction> _userTransactions = [
    // Transaction(id: '12', name: 'Shoes', amount: 69.99, time: DateTime.now()),
    // Transaction(id: '22', name: 'Socks', amount: 19.99, time: DateTime.now()),
    // Transaction(id: '31', name: 'Legs', amount: 99.99, time: DateTime.now()),
  ];

  void addTransaction(Transaction transaction) {
    setState(() {
      _userTransactions.add(transaction);
    });
  }

  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (ctx) {
        return NewTransaction(addTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses'),
        actions: [
          IconButton(
            onPressed: () => startAddNewTransaction(context),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: const Text('Chart'),
              width: double.infinity,
              alignment: AlignmentDirectional.center,
              height: 20,
            ),
            TransactionList(userTransactions: _userTransactions)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => startAddNewTransaction(context),
        child: const Icon(Icons.add),
      ),
      // floatingActionButton: Builder(
      //   builder: (context) => FloatingActionButton(
      //     child: const Icon(Icons.add),
      //     onPressed: () {
      //       startAddNewTransaction(context);
      //     },
      //   ),
      // ),
    );
  }
}


// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter App',
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   // String titleInput;
//   // String amountInput;
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final List<Transaction> _userTransactions = [
//     Transaction(
//       id: 't1',
//       name: 'New Shoes',
//       amount: 69.99,
//       time: DateTime.now(),
//     ),
//     Transaction(
//       id: 't2',
//       name: 'Weekly Groceries',
//       amount: 16.53,
//       time: DateTime.now(),
//     ),
//   ];

//   void _addNewTransaction(String txTitle, double txAmount) {
//     final newTx = Transaction(
//       name: txTitle,
//       amount: txAmount,
//       time: DateTime.now(),
//       id: DateTime.now().toString(),
//     );

//     setState(() {
//       _userTransactions.add(newTx);
//     });
//   }

//   void _startAddNewTransaction(BuildContext ctx) {
//     showModalBottomSheet(
//       context: ctx,
//       builder: (_) {
//         return GestureDetector(
//           onTap: () {},
//           child: NewTransaction(_addNewTransaction),
//           behavior: HitTestBehavior.opaque,
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Flutter App'),
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(Icons.add),
//             onPressed: () => _startAddNewTransaction(context),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           // mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             Container(
//               width: double.infinity,
//               child: const Card(
//                 color: Colors.blue,
//                 child: Text('CHART!'),
//                 elevation: 5,
//               ),
//             ),
//             TransactionList(
//               userTransactions: _userTransactions,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: () => _startAddNewTransaction(context),
//       ),
//     );
//   }
// }