import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_zissen/screens/welcome_page.dart';
import 'package:flutter_zissen/services/firebase_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onPressed: () async {
              FirebaseService service = new FirebaseService();
              await service.signOutFromGoogle();
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => WelcomePage(),
                ),
              );
            },
          ),
        ],
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.blue),
        title: Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(user!.email!),
            Text(user!.displayName!),
            CircleAvatar(
              backgroundImage: NetworkImage(user!.photoURL!),
              radius: 20,
            ),
            TextButton(
              child: Text("Back to Welcome Page"),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => WelcomePage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
