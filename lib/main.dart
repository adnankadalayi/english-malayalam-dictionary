import 'package:dictionary/functions/db_functions.dart';
import 'package:dictionary/models/data_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'screens/eng_mal_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(DictionaryModelAdapter().typeId)) {
    Hive.registerAdapter(DictionaryModelAdapter());
  }
  await Hive.openBox<DictionaryModel>('dictionary');
  addCsvToHive();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: EngMalScreen(),
    );
  }
}
