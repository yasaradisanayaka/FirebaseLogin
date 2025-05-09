import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/Data/DataSource.dart';
import 'package:fluttertoast/fluttertoast.dart';

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

  _bodyWidget() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    child: Icon(
                      Icons.clear
                    ),
                    onTap: () {
                      nameController.clear();
                    },
                  ),
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(
                height: 10,
              ),

              TextField(
                controller: idController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    child: Icon(
                      Icons.clear
                    ),
                    onTap: () {
                      idController.clear();
                    },
                  ),
                  labelText: 'Id',
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(
                height: 10,
              ),

              TextField(
                controller: degreeController,
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    child: Icon(
                      Icons.clear
                    ),
                    onTap: () {
                      degreeController.clear();
                    },
                  ),
                  labelText: 'Degree',
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(
                height: 20,
              ),

              ElevatedButton(
                onPressed: () async {
                  Map<String, dynamic> studentDetails = {
                    'name': nameController.text,
                    'id': idController.text,
                    'degree': degreeController.text
                  };
                  try {
                    await Database()
                      .addStudent(studentDetails, idController.text)
                      .then((value) => {
                        nameController.clear(),
                        idController.clear(),
                        degreeController.clear(),
                              
                        Fluttertoast.showToast(
                          msg: "Data added successfully",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 16.0
                        )
                      });
                  } catch (e) {
                    Fluttertoast.showToast(
                      msg: e.toString(),
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0
                    );
                  }
                },
                child: Text("Submit"),
              )
            ],
          ),
        ),
      ),
    );
  }
}