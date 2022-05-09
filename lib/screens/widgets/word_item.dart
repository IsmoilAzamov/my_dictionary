
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_dictionary/models/my_webview.dart';
import 'package:my_dictionary/models/word.dart';


class WordItem extends StatefulWidget {
  final Word word;
  const WordItem(this.word,{Key? key}) : super(key: key);

  @override
  State<WordItem> createState() => _WordItemState();
}

class _WordItemState extends State<WordItem> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>WebViewExample(name: wordCompleter(widget.word.country??'Uzbekistan'))));},
      child: Card(
        elevation: 8,
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          child: Row(
            children: [
              Container(


                width: 60,
                height: 40,
                child: Image.network('https://www.countries-ofthe-world.com/flags-normal/flag-of-${wordCompleter(widget.word.country??'Uzbekistan')}.png'),
              ),
              const SizedBox(width: 12,),
              Expanded(child: Text(widget.word.country??"...", style: const TextStyle(fontSize: 24, color: Colors.black), )),
              const Divider(thickness: 2,color: Colors.black26,),

            ],
          ),
        ),
      ),
    );
  }

  wordCompleter(String word){
    String word2='';
    for(int i=0; i<word.length;i++){
      if(word[i]==' '){
        word2=word2+'-';
      }
      else {
        word2=word2+word[i];
      }
    }
    return word2;
    print(word2);
  }
}
