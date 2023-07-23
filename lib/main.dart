import 'package:flutter/material.dart';

import 'add_task.dart';
import 'informations.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Reminders(),
    );
  }
}
