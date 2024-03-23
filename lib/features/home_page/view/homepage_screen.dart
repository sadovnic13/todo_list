import 'package:flutter/material.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/add_todo_page_screen');
          },
          child: Icon(Icons.add)),
      body: Text('Hi'),
    );
  }
}
