import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:my_dictionary/utils/constants.dart';
import 'package:path_provider/path_provider.dart';
import 'package:my_dictionary/models/word.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._instance();

  static Database? _db;

  DatabaseHelper._instance();

  final String tableName = "desc";
  final String colId = 'id';
  final String colCity = 'desc';
  final String colCountry = 'job';

  Future<Database?> get db async {
    return _db ?? await  _initDB();
  }

  Future<Database?> _initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = documentsDirectory.path + "alljobs.db";
    _db = await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await db.execute("CREATE TABLE $tableName ("
              "$colId INTEGER PRIMARY KEY,"
              "$colCity TEXT,"
              "$colCountry TEXT"
              ")");
        });
    return _db;
  }

  Future<void> loadDB(context) async {
    String data =
    await DefaultAssetBundle.of(context).loadString("assets/alljobs.json");
    final jsonResult = jsonDecode(data);

    List<Word> alljobs = jsonResult.map<Word>((data) {
      return Word.fromJson(data);
    }).toList();

    for (var word in alljobs) {
      await insert(word);

    }
    saveState();
  }


  Future<void> saveState()async{
    SharedPreferences prefs =await SharedPreferences.getInstance();
    await prefs.setBool(Constants.IS_DATABASE_INIT, true);

  }

  Future<Word> insert(Word word) async {
    final data = await db;
    word.id = await data?.insert(tableName, word.toMap());
    return word;
  }

  Future<List<Map<String, Object?>>?> getWordMap({String? word}) async {
    final data = await db;
    final List<Map<String, Object?>>? result;
    if (word == null) {
      result = await data?.query(tableName);
    } else {
      result = await data?.query(
        tableName,
        where: '$colCountry LIKE ?',
        whereArgs: ["$word%"],
      );
    }
    return result;
  }

  Future<List<Word>> getWords() async {
    final List<Map<String, Object?>>? wordMap = await getWordMap();
    final List<Word> words = [];
    wordMap?.forEach((element) {
      words.add(Word.fromMap(element));
    });
    return words;
  }

  Future<int?> update(Word word) async {
    final data = await db;
    return await data?.update(tableName, word.toMap(),
        where: '$colId = ?', whereArgs: [word.id]);
  }

  Future<int?> delete(int wordId) async {
    final data = await db;
    return await data?.delete(
      tableName,
      where: '$colId = ?',
      whereArgs: [wordId],
    );
  }

  Future<List<Word>> getWordLike(String word) async {
    final List<Map<String, Object?>>? wordMap = await getWordMap(word: word);
    final List<Word> words = [];
    wordMap?.forEach((element) {
      words.add(Word.fromMap(element));
    });
    return words;
  }


}