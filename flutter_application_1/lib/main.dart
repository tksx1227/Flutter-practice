import 'package:flutter/material.dart';
import 'package:flutter_application_1/next_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      // initialRoute: "/",
      // routes: {
      //   "/": (context) => MyHomePage(title: 'Flutter Demo Home Page'),
      //   "/next": (context) => NextPage(),
      // },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter入校式"),
        actions: <Widget>[Icon(Icons.add), Icon(Icons.share)],
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("次へ"),
          onPressed: () {
            // Navigator.pushNamed(context, "/next");
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NextPage("TOMORI"),
              ),
            );
          },
        ),
      ),
    );
  }
}
