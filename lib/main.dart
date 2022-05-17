import 'package:flutter/material.dart';
import 'package:my_dictionary/models/main_provider.dart';
import 'package:my_dictionary/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_)=>MainProvider(

    ))
  ],child: const MyApp(),)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}
