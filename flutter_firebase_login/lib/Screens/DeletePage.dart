import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/Data/DataSource.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Deletepage extends StatefulWidget {
  const Deletepage({super.key});

  @override
  State<Deletepage> createState() => _DeletepageState();
}

class _DeletepageState extends State<Deletepage> {

  TextEditingController idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete'),
        centerTitle: true,
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
                controller: idController,
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

              SizedBox(
                height: 20,
              ),

              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                    MaterialStateColor.resolveWith(
                      (states) => Colors.red
                    )
                ),

                onPressed: () async {
                  print(idController.text);

                  await Database()
                    .deleteStudent(idController.text)
                    .then((value) => {
                      Fluttertoast.showToast(
                        msg: "Deleted successfully",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16.0
                      )
                    });
                  idController.clear();
                },
                child: Text("Delete"),
              )
            ],
          ),
        ),
      ),
    );
  }
}