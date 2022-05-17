import 'package:flutter/material.dart';
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
    return SafeArea(
      child: InkWell(
        onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>  SafeArea(
          child: Scaffold(body: Container(
              margin: const EdgeInsets.only(right: 12, left: 12, top: 78),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
               Text(widget.word.job??"...", textAlign: TextAlign.center, style: const TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold), ),
                  const SizedBox(height: 20,),
                  Text("${widget.word.desc}", style: const TextStyle(fontSize: 18),),
                ],
              )))
        )));},
        child: Card(
          elevation: 8,
          margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 5),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            child: Row(
              children: [

                const SizedBox(width: 12,),
                Expanded(child: Text(widget.word.job??"...",  style: const TextStyle(fontSize: 24, color: Colors.white), )),
                const Divider(thickness: 2,color: Colors.black26,),
                const Icon(Icons.chevron_right_sharp, size: 29, color: Colors.white30,)

              ],
            ),
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

  }
}
