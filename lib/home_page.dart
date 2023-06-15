import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:personal_website/console.dart';
import 'package:personal_website/project_card.dart';

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
                height: 500,
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          "assets/console_back.webp",
                        ),
                        fit: BoxFit.cover)),
                child: const Center(child: Console())),
            const SizedBox(
              height: 50,
            ),
            const Center(
                child: Text(
              "My projects",
              style:
                  TextStyle(fontSize: 32, decoration: TextDecoration.underline),
            )),

            const SizedBox(
              height: 25,
            ),
            const Wrap(
              children: [
                ProjectCard(),
                ProjectCard(),
                ProjectCard(),
                ProjectCard(),
              ],
            )
          ],
        )),
        Container(
          padding: const EdgeInsets.all(15),
          color: Colors.transparent,
          child: IconButton(
            onPressed: () async {
              await zoomDrawerController.toggle!();
            },
            icon: const Icon(Icons.menu),
          ),
        ),
      ],
    ));
  }
}
