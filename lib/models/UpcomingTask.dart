// ignore_for_file: file_names

import 'package:flutter/material.dart';

class UpcomingTaskModel {
  final String name;
  final DateTime deadline;
  final String taskDetails;
  final Color boxColor;
  final Color textColor;

  UpcomingTaskModel({
    required this.name,
    required this.deadline,
    required this.taskDetails,
    required this.boxColor,
    required this.textColor,
  });
}

List<UpcomingTaskModel> upcomingTasks = [
  UpcomingTaskModel(
    name: 'Study for Exam',
    deadline: DateTime(2023, 11, 12, 15, 30),
    taskDetails: 'Prepare for the upcoming exam on calculus.',
    boxColor: Colors.deepPurpleAccent,
    textColor: Colors.white,
  ),
  UpcomingTaskModel(
    name: 'Submit Assignment',
    deadline: DateTime(2023, 11, 15, 9, 0),
    taskDetails: 'Submit the research paper assignment for the semester.',
    boxColor: Colors.red,
    textColor: Colors.white,
  ),
  UpcomingTaskModel(
    name: 'Group Project Meeting',
    deadline: DateTime(2023, 11, 18, 16, 45),
    taskDetails: 'Meeting with the group for the final project discussion.',
    boxColor: Colors.green,
    textColor: Colors.white,
  ),
  UpcomingTaskModel(
    name: 'Research Presentation',
    deadline: DateTime(2023, 11, 22, 14, 0),
    taskDetails: 'Prepare and deliver a presentation on the research findings.',
    boxColor: Colors.yellow,
    textColor: Colors.white,
  ),
  UpcomingTaskModel(
    name: 'Final Exams',
    deadline: DateTime(2023, 11, 30, 9, 30),
    taskDetails: 'Take the final exams for all subjects.',
    boxColor: Colors.purple,
    textColor: Colors.white,
  ),
];
