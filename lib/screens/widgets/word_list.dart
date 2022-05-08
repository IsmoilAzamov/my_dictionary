import 'package:flutter/material.dart';
import 'package:my_dictionary/database_helper.dart';
import 'package:my_dictionary/models/main_provider.dart';
import 'package:my_dictionary/screens/widgets/word_item.dart';
import 'package:provider/provider.dart';

import '../../models/word.dart';





class WordList extends StatefulWidget {
  const WordList({Key? key}) : super(key: key);

  @override
  State<WordList> createState() => _WordListState();
}

class _WordListState extends State<WordList> {

  @override
  void initState() {

    super.initState();
  }

  @override
 Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.3,
      child: Consumer<MainProvider>(builder: (context, data, child){
        return FutureBuilder(
        future: DatabaseHelper.instance.getWords(),
      builder:
      (BuildContext context, AsyncSnapshot<List<Word>> snapshot){
          if(!snapshot.hasData){
            return const Center(child: Text("No Data Found", style: TextStyle(fontSize: 24),),);
          }
          return ListView.builder(
          padding: const EdgeInsets.only(bottom: 10),
      itemBuilder: (context, index){
            return WordItem(snapshot.data![index]);
      },
      itemCount: snapshot.data?.length ?? 0,
      );
      },
        );
      }),
    );
  }



}
