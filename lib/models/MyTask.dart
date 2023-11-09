// ignore_for_file: file_names

import 'package:flutter/material.dart';

class MyTaskModel {
  String name;
  IconData icon;
  Color boxColor;
  Color textColor;

  MyTaskModel({
    required this.name,
    required this.icon,
    required this.boxColor,
    required this.textColor,
  });
}

class MyTask {
  final List<Color> availableColors = [
    Colors.red,
    Colors.lightBlue,
    Colors.green,
    Colors.yellow,
    Colors.blue,
    Colors.purple,
  ];

  int colorIndex = 0;

  List<MyTaskModel> getModel() {
    List<MyTaskModel> myTasks = [];

    for (int i = 1; i <= 6; i++) {
      if (colorIndex >= availableColors.length) {
        colorIndex = 0;
      }

      Color boxColor = availableColors[colorIndex];

      Color textColor =
          boxColor.computeLuminance() > 0.5 ? Colors.black : Colors.white;

      myTasks.add(MyTaskModel(
        name: 'Tugas $i',
        icon: Icons.task,
        boxColor: boxColor,
        textColor: textColor,
      ));

      colorIndex++;
    }

    return myTasks;
  }
}
