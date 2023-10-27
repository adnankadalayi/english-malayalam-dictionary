import 'package:hive/hive.dart';

part 'data_model.g.dart';

@HiveType(typeId: 1)
class DictionaryModel {
  @HiveField(0)
  final String englishWord;

  @HiveField(1)
  final String partOfSpeech;

  @HiveField(2)
  final String malayalamDefinition;

  DictionaryModel({
    required this.englishWord,
    required this.partOfSpeech,
    required this.malayalamDefinition,
  });
}
