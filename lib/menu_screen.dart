import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.teal,
        padding: const EdgeInsets.only(left: 25),
        child: Center(
            child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Push Page",
                  style: TextStyle(fontSize: 24.0, color: Colors.white),
                ))));
  }
}
