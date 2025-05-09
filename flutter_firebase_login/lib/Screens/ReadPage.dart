import 'package:flutter/material.dart';

class Readpage extends StatefulWidget {
  const Readpage({super.key});

  @override
  State<Readpage> createState() => _ReadpageState();
}

class _ReadpageState extends State<Readpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Read"),
      ),
      body: Center(
        child: Text("Read Page"),
      ),
    );
  }
}