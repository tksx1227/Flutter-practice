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
      // home: MyHomePage(),
      home: MyWidget(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text("Practice!!!"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.developer_board),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Spacer(),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 5),
              ),
              child: ListView(
                children: <Widget>[
                  Card(
                    child: ListTile(
                      title: Text("Title"),
                      trailing: Icon(Icons.favorite),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text("Title"),
                      trailing: Icon(Icons.thumb_up),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text("Title"),
                      trailing: Icon(Icons.thumb_down),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text("Title"),
                      trailing: Icon(Icons.favorite),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text("Title"),
                      trailing: Icon(Icons.thumb_up),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text("Title"),
                      trailing: Icon(Icons.thumb_down),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text("First line"),
                    Text("Second line"),
                    Text("Third line"),
                  ],
                ),
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite),
                  color: Colors.pink,
                  iconSize: 46,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.comment),
                  color: Colors.black,
                  iconSize: 46,
                ),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text("Practice!!!"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.developer_board),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              count.toString(),
              style: TextStyle(
                fontSize: 48,
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  count++;
                });
              },
              child: Text("カウントアップ"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  count = 0;
                });
              },
              child: Text("リセット"),
            ),
          ],
        ),
      ),
    );
  }
}
