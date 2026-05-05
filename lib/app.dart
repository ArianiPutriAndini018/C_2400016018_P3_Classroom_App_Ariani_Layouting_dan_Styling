import 'package:flutter/material.dart';
import 'pages/class_schedule_page.dart';


class MyClassroomApp extends StatelessWidget {
  const MyClassroomApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jadwal Kelas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF8F4EC),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFF4B6C2),
        ),
        useMaterial3: true,
      ),
      home: const ClassSchedulePage(),
    );
  }
}