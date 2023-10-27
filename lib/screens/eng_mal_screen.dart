import 'package:dictionary/functions/list_data.dart';
import 'package:dictionary/screens/base_screen.dart';
import 'package:dictionary/screens/mal_eng_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EngMalScreen extends StatelessWidget {
  const EngMalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: (details) {
        Get.off(
          () => const MalEngScreen(),
        );
        dictionaryList.clear();
        dictionaryDataMap.clear();
      },
      child: BaseScreen(
        color: Colors.blue,
        appBarText: 'English -> മലയാളം ...',
        textFieldText: 'Type English Word',
        pageRoute: () {
          Get.off(
            () => const MalEngScreen(),
          );
          dictionaryList.clear();
          dictionaryDataMap.clear();
        },
        listData: englishWordsList,
      ),
    );
  }
}
