// Created at : 26/10/2023
// Created by : Adnan
// Description : Showing the history of the searched and opened words
// Scrum : 1
// task : 4

import 'package:dictionary/widgets/definition_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

var historyMap = {}.obs;

historyAlertDialog(String title) {
// show the history screen
  Get.dialog(
    Padding(
      padding: const EdgeInsets.all(15.0),
      child: Scaffold(
        appBar: AppBar(
            title: Text(
              '$title History',
            ),
            actions: [
              IconButton(
                onPressed: () {
                  historyMap.clear();
                  Get.back();
                },
                icon: const Icon(
                  Icons.delete_outline,
                  color: Colors.redAccent,
                ),
              )
            ]),
        body: Obx(
          () => ListView.builder(
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () =>
                    defintionAlertDialog(historyMap.keys.elementAt(index)),
                child: Card(
                  color: Colors.grey,
                  child: ListTile(
                    title: Text(
                      historyMap.keys.elementAt(index),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              );
            },
            itemCount: historyMap.length,
          ),
        ),
      ),
    ),
  );
}
