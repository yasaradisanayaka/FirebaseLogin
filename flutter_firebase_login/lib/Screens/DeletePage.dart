import 'package:flutter/material.dart';

class Deletepage extends StatefulWidget {
  const Deletepage({super.key});

  @override
  State<Deletepage> createState() => _DeletepageState();
}

class _DeletepageState extends State<Deletepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delete"),
      ),
      body: Center(
        child: Text("Delete Page"),
      ),
    );
  }
}