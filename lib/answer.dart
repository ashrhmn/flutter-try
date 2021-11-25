import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final int answer;

  // ignore: use_key_in_widget_constructors
  const Answer(this.selectHandler, this.answer);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(5),
      child: ElevatedButton(
        child: Text(answer.toString()),
        onPressed: selectHandler,
        style: ElevatedButton.styleFrom(primary: Colors.purple),
      ),
    );
  }
}
