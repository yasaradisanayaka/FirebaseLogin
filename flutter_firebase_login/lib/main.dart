import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/Screens/CreatePage.dart';
import 'package:flutter_firebase_login/Screens/DeletePage.dart';
import 'package:flutter_firebase_login/Screens/ReadPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      home: Home(),
    ),
  );
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  int selectIndex=0;

  List screens = [Createpage(),Readpage(),Deletepage()];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: screens[selectIndex],

      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.add), label: "Create"),
        BottomNavigationBarItem(icon: Icon(Icons.read_more), label: "Read"),
        BottomNavigationBarItem(icon: Icon(Icons.delete), label: "Delete"),
      ],
      type: BottomNavigationBarType.fixed,
      currentIndex: selectIndex,
      onTap: (index){
        setState(() {
          selectIndex = index;
        });
      },
      ),
    );
  }
}

