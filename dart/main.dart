// ignore_for_file: library_private_types_in_public_api, unnecessary_string_interpolations

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(
        title: '',
      ),
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  late int firstnum;
  late int secondnum;
  String texttodisplay = "";
  late String res;
  late String opperatortoperform;
  void btnclicked(String btnval) {
    if (btnval == "C") {
      texttodisplay = "";
      firstnum = 0;
      secondnum = 0;
      res = "";
    } else if (btnval == "+" ||
        btnval == "-" ||
        btnval == "x" ||
        btnval == "/") {
      firstnum = int.parse(texttodisplay);
      res = "";
      opperatortoperform = btnval;
    } else if (btnval == "=") {
      if (texttodisplay != "") {
        secondnum = int.parse(texttodisplay);
        if (opperatortoperform == "+") {
          res = (firstnum + secondnum).toString();
        }
        if (opperatortoperform == "-") {
          res = (firstnum - secondnum).toString();
        }
        if (opperatortoperform == "x") {
          res = (firstnum * secondnum).toString();
        }
        if (opperatortoperform == "/") {
          res = (firstnum ~/ secondnum).toString();
        }
      } else {
        res = "0";
      }
    } else {
      res = int.parse(texttodisplay + btnval).toString();
    }

    setState(() {
      texttodisplay = res;
    });
  }

  Widget custombutton(String btnval) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: () => btnclicked(btnval),
        child: Text(
          "$btnval",
          style: const TextStyle(
            fontSize: 50.0,
          ),
        ),
      ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.calculate_outlined, color: Colors.white,),
        title: const Text(
          'Calculator',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              alignment: Alignment.bottomRight,
              child: Text(
                "$texttodisplay",
                style: const TextStyle(
                  fontSize: 100.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Row(
            children: [
              custombutton("9"),
              custombutton("8"),
              custombutton("7"),
              custombutton("+"),
            ],
          ),
          Row(
            children: [
              custombutton("6"),
              custombutton("5"),
              custombutton("4"),
              custombutton("-"),
            ],
          ),
          Row(
            children: [
              custombutton("3"),
              custombutton("2"),
              custombutton("1"),
              custombutton("x"),
            ],
          ),
          Row(
            children: [
              custombutton("C"),
              custombutton("0"),
              custombutton("="),
              custombutton("/"),
            ],
          ),
        ],
      ),
    );
  }
}
