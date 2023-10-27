// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DictionaryModelAdapter extends TypeAdapter<DictionaryModel> {
  @override
  final int typeId = 1;

  @override
  DictionaryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DictionaryModel(
      englishWord: fields[0] as String,
      partOfSpeech: fields[1] as String,
      malayalamDefinition: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DictionaryModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.englishWord)
      ..writeByte(1)
      ..write(obj.partOfSpeech)
      ..writeByte(2)
      ..write(obj.malayalamDefinition);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DictionaryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
