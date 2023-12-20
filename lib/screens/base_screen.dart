import 'package:dictionary/functions/list_data.dart';
import 'package:dictionary/widgets/confirmation_alert_dialog.dart';
import 'package:dictionary/widgets/definition_alert_dialog.dart';
import 'package:dictionary/widgets/history_alert_dialog.dart';
import 'package:dictionary/widgets/radio_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BaseScreen extends StatelessWidget {
  final Color color;
  final String appBarText;
  final String textFieldText;
  final VoidCallback pageRoute;
  final Function listData;
  BaseScreen(
      {super.key,
      required this.color,
      required this.appBarText,
      required this.textFieldText,
      required this.pageRoute,
      required this.listData});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => confirmAlertDialog(),
      child: Scaffold(
        drawer: Drawer(
          child: ListView(children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: color,
              ),
              child: const Center(
                child: Text(
                  'English <-> മലയാളം\n Dictionary',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
          ]),
        ),
        appBar: AppBar(
          backgroundColor: color,
          title: Text(
            appBarText,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          // actions: [
          //   IconButton(
          //     onPressed: () {
          //       Get.defaultDialog(
          //         title: 'Share this app',
          //         middleText: 'Not Implemented yet',
          //         textCancel: 'back',
          //       );
          //     },
          //     icon: const Icon(
          //       Icons.share,
          //       color: Colors.yellow,
          //     ),
          //   ),
          // ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(35),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ElevatedButton(
                        onPressed: color == Colors.blue ? () {} : pageRoute,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        child: const Text(
                          'Eng->മലയാളം',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ElevatedButton(
                        onPressed: color == Colors.black ? () {} : pageRoute,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                        ),
                        child: const Text(
                          'മലയാളം->Eng',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
        ),
        body: Column(children: [
          Expanded(
            child: ScrollConfiguration(
              behavior: const ScrollBehavior(),
              child: GlowingOverscrollIndicator(
                axisDirection: AxisDirection.down,
                color: Colors.red,
                child: Obx(
                  () => ListView.builder(
                      itemCount: dictionaryDataMap.length,
                      itemBuilder: (context, index) {
                        final data = dictionaryDataMap.keys.elementAt(index);
                        return GestureDetector(
                          onTap: () {
                            defintionAlertDialog(data);
                          },
                          child: Card(
                            margin: const EdgeInsets.all(4),
                            elevation: 1,
                            child: ListTile(
                              title: Text(data),
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ),
          ),
          Container(
            height: 70,
            color: color,
            child: Obx(
              () =>
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Expanded(
                  child: IconButton(
                    onPressed: () {
                      historyAlertDialog(
                          color == Colors.blue ? 'English' : 'മലയാളം');
                    },
                    icon: const Icon(
                      Icons.history,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: TextField(
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(
                        RegExp('^ '),
                      )
                    ],
                    controller: _controller,
                    onChanged: (value) {
                      userInput.value = value;
                      listData();
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: textFieldText,
                      hintStyle: const TextStyle(
                        fontSize: 15,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                userInput.isEmpty
                    ? Expanded(
                        child: IconButton(
                          onPressed: () {},
                          disabledColor: Colors.grey,
                          icon: const Icon(
                            Icons.mic_none,
                            // color: Colors.white,
                          ),
                        ),
                      )
                    : Expanded(
                        child: IconButton(
                          onPressed: () {
                            dictionaryList.clear();
                            dictionaryDataMap.clear();
                            _controller.clear();
                            userInput.value = '';
                          },
                          icon: const Icon(
                            Icons.close,
                            color: Colors.red,
                          ),
                        ),
                      ),
                Visibility(
                  visible: userInput.isEmpty ? false : true,
                  child: Expanded(
                    child: IconButton(
                      onPressed: () {
                        defintionAlertDialog(dictionaryList.first.englishWord);
                      },
                      icon: const Icon(
                        Icons.check_box_outlined,
                        color: Colors.lightGreen,
                      ),
                    ),
                  ),
                )
              ]),
            ),
          ),
          Row(children: [
            Flexible(
              child: RadioButton(
                radioButtonText: 'StartWith',
                value: RadioValue.startWith,
                color: color,
              ),
            ),
            Flexible(
              child: RadioButton(
                radioButtonText: 'Contains',
                color: color,
                value: RadioValue.contains,
              ),
            ),
            Flexible(
              child: RadioButton(
                radioButtonText: 'EndsWith',
                color: color,
                value: RadioValue.endsWith,
              ),
            ),
          ]),
        ]),
      ),
    );
  }
}
