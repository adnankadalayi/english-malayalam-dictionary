import 'package:dictionary/functions/list_data.dart';
import 'package:dictionary/screens/base_screen.dart';
import 'package:dictionary/screens/eng_mal_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MalEngScreen extends StatelessWidget {
  const MalEngScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: (details) {
        Get.off(
          () => const EngMalScreen(),
        );
        dictionaryList.clear();
        dictionaryDataMap.clear();
      },
      child: BaseScreen(
        color: Colors.black,
        appBarText: 'മലയാളം -> English ...',
        textFieldText: 'മലയാളത്തിൽ ടൈപ്പ് ചെയ്യുക',
        pageRoute: () {
          Get.off(
            () => const EngMalScreen(),
          );
          dictionaryList.clear();
          dictionaryDataMap.clear();
        },
        listData: malayalamWordsList,
      ),
    );
  }
}
