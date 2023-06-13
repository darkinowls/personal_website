import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:personal_website/console.dart';

class HomePage extends StatelessWidget {
  final ZoomDrawerController zoomDrawerController;

  const HomePage(this.zoomDrawerController, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SingleChildScrollView(
            child: Column(
          children: [
            Container(
                height: 600,
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          "assets/console_back.webp",
                        ),
                        fit: BoxFit.cover)),
                child: const Center(child: Console())),
            Container(
              height: 500,
              width: 100,
            )
          ],
        )),
        ListTile(
          leading: IconButton(
            onPressed: () async {
              await zoomDrawerController.toggle!();
            },
            icon: const Icon(Icons.menu),
          ),
          tileColor: Colors.transparent,
        ),
      ],
    ));
  }
}