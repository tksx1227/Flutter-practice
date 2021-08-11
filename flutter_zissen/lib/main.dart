import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

bool USE_FIRESTORE_EMULATOR = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  if (USE_FIRESTORE_EMULATOR) {
    FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Book list",
      home: BookListPage(),
    );
  }
}

class BookListPage extends StatelessWidget {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('books').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Book List"),
      ),
      body: Center(
        child: StreamBuilder<QuerySnapshot>(
            stream: _usersStream, builder: readData),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (BuildContext context) => BookAddPage(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget readData(BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    return ListView(
      children: snapshot.data!.docs.map((DocumentSnapshot document) {
        Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
        return Card(
          child: ListTile(
            title: Text(data["title"]),
            subtitle: Text(data["author"]),
          ),
        );
      }).toList(),
    );
  }
}

class BookAddPage extends StatefulWidget {
  @override
  _BookAddPageState createState() => _BookAddPageState();
}

class _BookAddPageState extends State<BookAddPage> {
  CollectionReference _colRef = FirebaseFirestore.instance.collection('books');
  String _title = "";
  String _author = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("本を追加"),
      ),
      body: Container(
        padding: EdgeInsets.all(64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "タイトル：$_title",
              style: TextStyle(color: Colors.blue),
            ),
            Text(
              "著者：$_author",
              style: TextStyle(color: Colors.blue),
            ),
            const SizedBox(height: 8),
            TextField(
              onChanged: (String value) {
                setState(() {
                  _title = value;
                });
              },
            ),
            const SizedBox(height: 8),
            TextField(
              onChanged: (String value) {
                setState(() {
                  _author = value;
                });
              },
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _colRef
                      .add({"title": _title, "author": _author}).then((value) {
                    print("Books Added");
                    setState(() {
                      _title = "";
                      _author = "";
                    });
                    Navigator.of(context).pop();
                  }).catchError((error) {
                    print("Failed to add books: $error");
                  });
                },
                child: Text(
                  "追加",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("キャンセル"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
