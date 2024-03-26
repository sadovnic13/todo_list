import 'package:flutter/material.dart';

import 'router/router.dart';

class ToDoList extends StatelessWidget {
  const ToDoList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
      theme: ThemeData(
        fontFamily: 'Sora',
        visualDensity: VisualDensity.adaptivePlatformDensity,
        canvasColor: Colors.transparent,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF3F37C9)),
        useMaterial3: true,
      ),
      initialRoute: '/log_page_screen',
    );
  }
}
