import 'package:csv/csv.dart';
import 'package:dictionary/models/data_model.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

final Box<DictionaryModel> dictionaryDB = Hive.box('dictionary');
List<List<dynamic>> data = [];

// function to add data from csv file to hive
// first convert csv to string
// then convert to list using csv package
// add the value to hive by looping through the list
Future<void> addCsvToHive() async {
  if (dictionaryDB.isEmpty) {
    final rawData = await rootBundle.loadString('assets/olam-enml.csv');
    data = const CsvToListConverter().convert(rawData, fieldDelimiter: '\t');

    for (var i = 1; i < data.length; i++) {
      final value = DictionaryModel(
        englishWord: data[i][1].toString(),
        partOfSpeech: data[i][2].toString(),
        malayalamDefinition: data[i][3].toString(),
      );

      await dictionaryDB.add(value);
    }
  } else {}
}
