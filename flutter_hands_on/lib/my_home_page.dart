import "package:flutter/material.dart";
import "create_page.dart";

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Todo> _todoItems = [
    Todo("情報理論のZoom講義", Icons.computer_outlined),
    Todo("脳型システムの課題", Icons.computer_sharp),
  ];

  void _addTodo(Todo todo) {
    setState(() {
      _todoItems.add(todo);
    });
  }

  void _deleteTodo(int index) {
    setState(() {
      _todoItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // body: ListView(
      //   children: [
      //     Card(
      //       child: ListTile(
      //         title: Text("サンプルテキスト１"),
      //       ),
      //     ),
      //     Card(
      //       child: ListTile(
      //         title: Text("サンプルテキスト２"),
      //       ),
      //     ),
      //     Card(
      //       child: ListTile(
      //         title: Text("サンプルテキスト３"),
      //       ),
      //     )
      //   ],
      // ),
      body: ListView.builder(
        itemCount: _todoItems.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: Colors.red),
              ),
              child: ListTile(
                leading: Icon(_todoItems[index].icon, size: 35.0),
                title: Text(_todoItems[index].title),
                trailing: IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () => showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: Text(_todoItems[index].title),
                      actions: [
                        IconButton(
                          onPressed: () {
                            _deleteTodo(index);
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.delete),
                          color: Colors.red,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final Todo todo = await Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => CreatePage()));
          if (todo != Null) _addTodo(todo);
        },
        tooltip: "Add Todo",
        child: Icon(Icons.add),
      ),
    );
  }
}

class Todo {
  String title;
  IconData? icon;

  Todo(this.title, this.icon);
}
