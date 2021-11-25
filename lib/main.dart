import 'package:first_app/answer.dart';
import 'package:first_app/question.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
  final questions = const [
    {
      'question': 'What is 1?',
      'answers': ['1', '2', '3']
    },
    {
      'question': 'What is 5?',
      'answers': ['4', '6', '5']
    },
    {
      'question': 'What is 9?',
      'answers': ['8', '9', '7']
    },
  ];

  void answer() {
    setState(() {
      if (qIndex == 2) {
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
            ...(questions[qIndex]['answers'] as List<String>)
                .map((ans) => Answer(answer, ans))
          ],
        ),
      ),
    );
  }
}
