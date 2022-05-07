import 'package:flutter/material.dart';
import 'package:my_dictionary/screens/widgets/word_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WordList(),
    );
  }
}
