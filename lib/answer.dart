import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answer;

  Answer(this.selectHandler, this.answer);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(5),
      child: ElevatedButton(
        child: Text(answer),
        onPressed: selectHandler,
        style: ElevatedButton.styleFrom(primary: Colors.purple),
      ),
    );
  }
}
