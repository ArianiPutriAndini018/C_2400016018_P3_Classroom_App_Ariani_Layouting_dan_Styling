import 'package:flutter/material.dart';

class ClassSchedule {
  final String title;
  final String type;
  final String className;
  final String day;
  final String time;
  final String room;
  final String lecturer;
  final IconData icon;
  final List<Color> colors;

  const ClassSchedule({
    required this.title,
    required this.type,
    required this.className,
    required this.day,
    required this.time,
    required this.room,
    required this.lecturer,
    required this.icon,
    required this.colors,
  });
}