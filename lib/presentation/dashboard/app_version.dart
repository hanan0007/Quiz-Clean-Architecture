import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pushable_button/pushable_button.dart';
import 'package:quiz_clean_archi/domain/const/global_const.dart';
import 'package:url_launcher/url_launcher.dart';

class AppVersionConfermation {
  static void showAppversionConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('App Version'),
          content: const Text('You have an old version of app'),
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
                    child: Text(
                      'Update',
                      style: TextStyle(
                          fontSize: 18,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.white
                                  : Colors.black,
                          fontWeight: FontWeight.bold),
                    ),

                    onPressed: () {
                      _launchURL();
                    },
                  ),
                ),
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
                    child: const Text('Close',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    onPressed: () => exit(0),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }

  static void _launchURL() async {
    const url =
        'https://play.google.com/store/apps/details?id=com.hmtechs.quiz_app';
    if (await launchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }
}
