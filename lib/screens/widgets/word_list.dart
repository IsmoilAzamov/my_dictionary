import 'package:flutter/material.dart';
import 'package:my_dictionary/database_helper.dart';
import 'package:my_dictionary/models/main_provider.dart';
import 'package:my_dictionary/screens/widgets/word_item.dart';
import 'package:my_dictionary/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class WordList extends StatefulWidget {
  const WordList({Key? key}) : super(key: key);

  @override
  State<WordList> createState() => _WordListState();
}

class _WordListState extends State<WordList> {
  String searchQuery = "";

  TextEditingController myController = TextEditingController();


  @override
  void initState() {
    super.initState();
  loadDB();
  }

 Future<void> loadDB()async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
    bool? isLoaded=prefs.getBool(Constants.IS_DATABASE_INIT)??false;

    if(!isLoaded){
     await DatabaseHelper.instance.loadDB(context);
    }
    updateQuery();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(elevation: 8,
        title: TextField(
          onChanged: (myController){
            setState(() {
              updateQuery(word: myController.toString());
              searchQuery=myController.toString();
            });
          },
          autofocus: true,
          controller: myController,
          decoration: InputDecoration(
            hintText: " Search...",
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusColor: Colors.black,
            suffixIcon: IconButton(
                onPressed: () {
                  clearSearchBar();
                },
                icon: const Icon(Icons.clear)),
          ),
          style: const TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              decorationStyle: TextDecorationStyle.dotted,
              decorationColor: Colors.black26),
        ),
        iconTheme: const IconThemeData(
            color: Color.fromRGBO(9, 133, 46, 100), size: 36),
        backgroundColor: Colors.black26,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.9,
        child: Consumer<MainProvider>(builder: (context, data, child) {
          return ListView.builder(
              //padding: const EdgeInsets.only(bottom: 10),
              itemBuilder: (context, index) {
                return WordItem(data.words[index]);
              },
              itemCount: data.words.length);
        }),
      ),
    );
  }

  updateQuery({String? word}) {
    setState(() {
      final mainProvider = Provider.of<MainProvider>(context, listen: false);

      mainProvider.initList(word: word);
    });
  }



  clearSearchBar() {


    myController.clear();
    updateQuery();
  }
}
