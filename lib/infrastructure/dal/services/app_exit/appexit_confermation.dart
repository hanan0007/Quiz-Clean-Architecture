import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pushable_button/pushable_button.dart';
import 'package:quiz_clean_archi/domain/const/global_const.dart';

class AppExitConfermation {
  static void showExitConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Exit App'),
          content: const Text('Do you want to close the app?'),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 100,
                  child: PushableButton(
                    height: 40,

                    elevation: 4,
                    hslColor: HSLColor.fromColor(
                        colorScheme(context).secondary), // Green color
                    shadow: BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 2),
                    ),
                    child: Text('Yes',
                        style: TextStyle(
                            fontSize: 18,
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.black
                                    : Colors.white,
                            fontWeight: FontWeight.bold)),
                    onPressed: () => exit(0),
                  ),
                ),
                // const SizedBox(
                //   width: 10,
                // ),
                SizedBox(
                  width: 100,
                  child: PushableButton(
                    height: 40,
                    elevation: 4,
                    hslColor:
                        const HSLColor.fromAHSL(1.0, 0, 1.0, 0.37), // Red color
                    shadow: BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 2),
                    ),
                    child: const Text('No',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
