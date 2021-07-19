import 'package:flutter/material.dart';

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Next Page!!"),
      ),
      body: Container(
        height: double.infinity,
        color: Colors.red,
        child: Center(
          child: ElevatedButton(
            child: Text("戻る"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}
