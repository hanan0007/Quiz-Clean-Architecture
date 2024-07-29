import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  String cat = '';
  final List<String> names = [
    'Techs',
    'Programming',
    'History',
    'Sports',
    'Art',
    'Science & Nature'
  ];
  final List<String> catagory = ['18', '18', '23', '21', '25', '17'];
  selectedcat(String cati) {
    cat = cati;
    update();
  }

  final List<IconData> icons = [
    Icons.devices, // Techs
    Icons.code, // Programming
    Icons.history_edu, // History
    Icons.new_releases, // Coming Soon
  ];
  final List<String> imagePaths = [
    'assets/images/ic_tech.png',
    'assets/images/ic_coding.png',
    'assets/images/ic_history.png',
    'assets/images/ic_sports.png',
    'assets/images/ic_art.png',
    'assets/images/ic_sci_nat.png',
  ];
}
