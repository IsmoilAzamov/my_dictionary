import 'package:flutter/material.dart';

import 'package:my_dictionary/screens/widgets/word_list.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String searchQuery="";
  TextEditingController myController=TextEditingController();
  @override
  Widget build(BuildContext context) {

    return  const WordList();

  }


}
