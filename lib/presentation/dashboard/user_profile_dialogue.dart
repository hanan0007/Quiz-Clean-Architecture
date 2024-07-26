import 'package:flutter/material.dart';
import 'package:pushable_button/pushable_button.dart';
import 'package:quiz_clean_archi/domain/const/global_const.dart';

class ProfileDialog {
  static void showProfileDialog(
      BuildContext context, String name, String age, String gender) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.transparent,
                foregroundImage: AssetImage(gender == 'Male'
                    ? 'assets/images/ic_men.png'
                    : gender == 'Female'
                        ? 'assets/images/ic_women.png'
                        : 'assets/images/ic_gay.png'),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 4,
                child: SizedBox(
                  height: height * 0.05,
                  width: width,
                  child: Center(
                    child: Text(
                      name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 4,
                child: SizedBox(
                  height: height * 0.05,
                  width: width * 0.6,
                  child: Center(
                    child: Text(
                      gender,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 4,
                child: SizedBox(
                  height: height * 0.05,
                  width: width * 0.3,
                  child: Center(
                    child: Text(
                      age,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            SizedBox(
              width: 100,
              child: PushableButton(
                height: 35,
                elevation: 4,
                hslColor: HSLColor.fromColor(
                    colorScheme(context).secondary), // Red color
                shadow: BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 2),
                ),
                child: const Text('Close',
                    style: TextStyle(
                        fontSize: 18,
                        // color: Theme.of(context).brightness == Brightness.light
                        //     ? Colors.black
                        //     : Colors.white,
                        fontWeight: FontWeight.bold)),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        );
      },
    );
  }
}
