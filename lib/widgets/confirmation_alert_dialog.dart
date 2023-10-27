import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> confirmAlertDialog() async {
  return await showDialog(
    context: Get.overlayContext!,
    builder: (context) {
      return AlertDialog(
        title: const Text('Exit Warning!'),
        content: const Text('Are you sure you want to exit?'),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
            ),
            onPressed: () => Get.back(result: false),
            child: const Text('No'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            onPressed: () => Get.back(result: true),
            child: const Text('Yes'),
          ),
        ],
      );
    },
  );
}
