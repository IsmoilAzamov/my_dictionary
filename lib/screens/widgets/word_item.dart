import 'package:flutter/material.dart';
import 'package:my_dictionary/models/word.dart';


class WordItem extends StatelessWidget {
  final Word word;
  const WordItem(this.word,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(word.country??"...".toString(), style: const TextStyle(fontSize: 24),),
          const Divider(thickness: 2, color: Colors.black26,),
        ],
      ),
    );
  }
}
