import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pushable_button/pushable_button.dart';
import 'package:quiz_clean_archi/domain/const/global_const.dart';

class DefaultScreen extends StatefulWidget {
  final String? msg;
  const DefaultScreen({super.key, this.msg});

  @override
  State<DefaultScreen> createState() => _DefaultScreenState();
}

class _DefaultScreenState extends State<DefaultScreen> {
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: colorScheme(context).secondary,
          automaticallyImplyLeading: false,
          title: Text(
            'Connection Error',
            style: TextStyle(
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.white
                    : Colors.black),
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.msg ?? 'No Internet'),
            const SizedBox(height: 20),
            SizedBox(
              width: width * 0.35,
              child: PushableButton(
                height: 50,
                elevation: 4,
                hslColor: HSLColor.fromColor(colorScheme(context).secondary),
                shadow: BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 2),
                ),
                child: !isCheck
                    ? const Text('Refresh',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))
                    : const CircularProgressIndicator(),
                onPressed: () async {
                  try {
                    setState(() {
                      isCheck = true;
                    });
                    var connectivityResult =
                        await Connectivity().checkConnectivity();
                    if (!connectivityResult.contains(ConnectivityResult.none)) {
                      Get.back();
                    }
                  } finally {
                    setState(() {
                      isCheck = false;
                    });
                  }
                },
              ),

              // ElevatedButton(
              //   onPressed: () async {
              //     try {
              //       setState(() {
              //         isCheck = true;
              //       });
              //       var connectivityResult =
              //           await Connectivity().checkConnectivity();
              //       if (!connectivityResult.contains(ConnectivityResult.none)) {
              //         Get.back();
              //       }
              //     } finally {
              //       setState(() {
              //         isCheck = false;
              //       });
              //     }
              //   },
              //   child: !isCheck
              //       ? Text("Refresh")
              //       : const CircularProgressIndicator(),
              // ),
            )
          ],
        ),
      ),
    );
  }
}
