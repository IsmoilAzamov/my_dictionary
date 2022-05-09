import 'package:flutter/material.dart';
import 'package:my_dictionary/models/word.dart';


class WordItem extends StatelessWidget {
  final Word word;
  const WordItem(this.word,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Row(
          children: [
            Expanded(child: Text(word.country??"...", style: const TextStyle(fontSize: 24, color: Colors.black), )),
            const Divider(thickness: 2,color: Colors.black26,),

          ],
        ),
      ),
    );
  }
}
