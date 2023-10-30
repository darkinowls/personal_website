import 'package:flutter/material.dart';
import 'package:personal_website/screen_controller.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.teal,
        padding: const EdgeInsets.only(left: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
        TextButton(
            onPressed: () {
              ScreenController.zoomOf(context).toggle!();
              ScreenController.scrollOf(context).position.animateTo(0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut);
            },
            child: const Text(
              "To console",
              style: TextStyle(fontSize: 24.0, color: Colors.white),
            )),
        TextButton(
            onPressed: () {
              ScreenController.zoomOf(context).toggle!();
              ScreenController.scrollOf(context).position.animateTo(500,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut);
            },
            child: const Text(
              "To projects",
              style: TextStyle(fontSize: 24.0, color: Colors.white),
            )),
          ],
        ));
  }
}
