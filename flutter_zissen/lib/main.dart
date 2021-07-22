import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  bool flag = false;

  _click() async {
    setState(() {
      flag = !flag;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.create),
            Text("初めてのタイトル"),
          ],
        ),
      ),
      drawer: Drawer(
        child: Center(
          child: Text("Drawer"),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedContainer(
              duration: Duration(seconds: 3),
              width: flag ? 100 : 50,
              height: flag ? 50 : 100,
              padding: flag ? EdgeInsets.all(0) : EdgeInsets.all(30),
              margin: flag ? EdgeInsets.all(0) : EdgeInsets.all(30),
              transform: flag ? Matrix4.skewX(0.0) : Matrix4.skewX(0.3),
              color: flag ? Colors.blue : Colors.grey,
            ),
            AnimatedSwitcher(
              duration: Duration(seconds: 3),
              child: flag
                  ? Text("何もない")
                  : Icon(Icons.favorite, color: Colors.pink),
            ),
            // AnimatedOpacity(
            //   opacity: flag ? 0.1 : 1.0,
            //   duration: Duration(seconds: 3),
            //   child: Text(
            //     "消える文字",
            //     style: Theme.of(context).textTheme.headline4,
            //   ),
            // ),
            // AnimatedSize(
            //   vsync: this,
            //   duration: Duration(seconds: 3),
            //   child: SizedBox(
            //     width: flag ? 50 : 200,
            //     height: flag ? 50 : 200,
            //     child: Container(color: Colors.purple),
            //   ),
            // ),
            // AnimatedAlign(
            //   alignment: flag ? Alignment.topLeft : Alignment.bottomRight,
            //   duration: Duration(seconds: 3),
            //   child: SizedBox(
            //     width: 50,
            //     height: 50,
            //     child: Container(color: Colors.green),
            //   ),
            // ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _click,
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
