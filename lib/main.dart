import 'package:first_app/answer.dart';
import 'package:first_app/question.dart';
import 'package:first_app/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

void main() {
  // runApp(const MyApp());
  runApp(const ExpenseApp());
}

class ExpenseApp extends StatefulWidget {
  const ExpenseApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ExpenseAppState();
  }
}

class ExpenseAppState extends State<ExpenseApp> {
  // late String titleInput;
  // late String amountInput;
  var titleController = TextEditingController();
  var amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Expenses'),
        ),
        body: Column(
          children: <Widget>[
            Container(
              child: const Text('Chart'),
              width: double.infinity,
              alignment: AlignmentDirectional.center,
              height: 20,
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Card(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextField(
                            decoration: const InputDecoration(
                              label: Text('Title'),
                            ),
                            controller: titleController,
                            // onChanged: (value) {
                            //   titleInput = value;
                            // },
                          ),
                          TextField(
                            decoration: const InputDecoration(
                              label: Text('Amount'),
                            ),
                            controller: amountController,
                            // onChanged: (value) {
                            //   amountInput = value;
                            // },
                          ),
                          TextButton(
                            onPressed: () => {},
                            child: const Text(
                              'Add Transaction',
                              textAlign: TextAlign.right,
                            ),
                          ),
                          const TransactionList()
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              width: double.infinity,
              alignment: AlignmentDirectional.center,
            ),
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var qIndex = 0;
  var result = 0;
  final questions = const [
    {
      'question': 'What is 1?',
      'options': [1, 2, 3],
      'ans': 1
    },
    {
      'question': 'What is 5?',
      'options': [4, 6, 5],
      'ans': 5
    },
    {
      'question': 'What is 4*16?',
      'options': [64, 65, 66],
      'ans': 64
    },
    {
      'question': 'What is 4/2?',
      'options': [8, 9, 2],
      'ans': 2
    },
    {
      'question': 'What is 50%7?',
      'options': [8, 1, 7],
      'ans': 1
    },
    {
      'question': 'What is 15*3/9?',
      'options': [8, 9, 5],
      'ans': 5
    },
  ];

  void answer(int ans) {
    setState(() {
      if (questions[qIndex]['ans'] == ans) {
        result++;
      }

      if (qIndex == questions.length - 1) {
        qIndex = 0;
      } else {
        qIndex++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My App'),
        ),
        body: Column(
          children: [
            Question(
              questions[qIndex]['question'] as String,
            ),
            ...(questions[qIndex]['options'] as List<int>)
                .map((ans) => Answer(() => answer(ans), ans)),
            Text('Your Score : ' + result.toString())
          ],
        ),
      ),
    );
  }
}
