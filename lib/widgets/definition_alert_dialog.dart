import 'package:dictionary/functions/list_data.dart';
import 'package:dictionary/models/data_model.dart';
import 'package:dictionary/widgets/history_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

final Box<DictionaryModel> dictionaryDB = Hive.box('dictionary');

void defintionAlertDialog(var id) async {
  var data;
  if (dictionaryDataMap.containsKey(id)) {
    data = dictionaryDataMap[id];
  }
  print(data);
  if (historyMap.keys.contains(id)) {
  } else {
    historyMap[id] = data;
  }

  await Get.dialog(Padding(
    padding: const EdgeInsets.all(15.0),
    child: Scaffold(
      appBar: AppBar(
        title: Text(
          '\'$id\' meaning',
          softWrap: true,
        ),
      ),
      body: Column(children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 10.0,
            ),
            child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  String partOfSpeechText = data[index]['type'];
                  switch (partOfSpeechText) {
                    case 'n':
                      partOfSpeechText = 'Noun';
                      break;
                    case 'phr':
                      partOfSpeechText = 'Phrase';
                      break;
                    case 'idm':
                      partOfSpeechText = 'Idiom';
                      break;
                    case 'a':
                      partOfSpeechText = 'Adjective';
                      break;
                    case 'v':
                      partOfSpeechText = 'Verb';
                      break;
                  }
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(children: [
                      Expanded(
                        flex: 3,
                        child: Text('${data[index]['meaning']}'),
                      ),
                      Expanded(
                        child: Text('($partOfSpeechText)'),
                      ),
                    ]),
                  );
                }),
          ),
        ),
      ]),
    ),
  ));
}
