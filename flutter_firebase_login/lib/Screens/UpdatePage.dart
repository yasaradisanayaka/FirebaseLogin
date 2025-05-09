import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/Data/DataSource.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UpdateScreen extends StatefulWidget {
  final String name;
  final int id;
  final String degree;

  const UpdateScreen({
    super.key,
    required this.name,
    required this.id,
    required this.degree,
  });

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController degreeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.name;
    idController.text = widget.id.toString();
    degreeController.text = widget.degree;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update'),
        centerTitle: true,
      ),
      body: _bodyWidget(),
    );
  }

  Widget _bodyWidget() {
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
                height: 10
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
                height: 10
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
                height: 20
              ),

              ElevatedButton(
                onPressed: () async {
                  Map<String, dynamic> studentDetails = {
                    'name': nameController.text,
                    'id': idController.text,
                    'degree': degreeController.text,
                  };

                  try {
                    await Database().updateStudentDetails(
                      studentDetails,
                      idController.text,
                    );

                    Fluttertoast.showToast(
                      msg: "Data updated successfully",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );

                    // Debug prints before clearing
                    print("Updated Name: ${nameController.text}");
                    print("Updated ID: ${idController.text}");
                    print("Updated Degree: ${degreeController.text}");

                    // Clear inputs
                    nameController.clear();
                    idController.clear();
                    degreeController.clear();

                    // Optional: navigate back
                    Navigator.pop(context);
                    
                  } catch (e) {
                    Fluttertoast.showToast(
                      msg: e.toString(),
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                  }
                },
                child: Text("Update"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
