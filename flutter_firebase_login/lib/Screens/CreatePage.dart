import 'package:flutter/material.dart';

class Createpage extends StatefulWidget {
  const Createpage({super.key});

  @override
  State<Createpage> createState() => _CreatepageState();
}

class _CreatepageState extends State<Createpage> {

  TextEditingController nameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController degreeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create"),
      ),

      body: _bodyWidget(),
    );
  }

  _bodyWidget(){
    return Column(
      children: [
        TextField(
          controller: nameController,
          decoration: InputDecoration(
            suffix: GestureDetector(
              child: Icon(
                Icons.clear
              ),
              onTap: () {
                nameController.clear();
              },
            ),
            labelText: "Name",
            border: OutlineInputBorder(),
          ),
        ),

        TextField(
          controller: idController,
          decoration: InputDecoration(
            suffix: GestureDetector(
              child: Icon(
                Icons.clear
              ),
              onTap: () {
                idController.clear();
              },
            ),
            labelText: "ID",
            border: OutlineInputBorder(),
          ),
        ),

        TextField(
          controller: degreeController,
          decoration: InputDecoration(
            suffix: GestureDetector(
              child: Icon(
                Icons.clear
              ),
              onTap: () {
                degreeController.clear();
              },
            ),
            labelText: "Degree",
            border: OutlineInputBorder(),
          ),
        ),
        
        ElevatedButton(
          onPressed: () {}, 
          child: Text("Submit")
        ),
      ],
    );
  }
}