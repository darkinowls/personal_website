import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:personal_website/main.dart';
import 'package:personal_website/screen_controller.dart';
import 'package:personal_website/widgets/console.dart';
import 'package:personal_website/widgets/project_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SingleChildScrollView(
          controller: ScreenController.scrollOf(context),
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
                ProjectCard(
                  projectName: "Cinema House",
                  text: "AAAAAAAAA",
                  projectNameSnake: "cinema_house",
                ),
                ProjectCard(
                  projectName: "Seagull drive (client)",
                  text: "AAAAAAAAA",
                  projectNameSnake: "seagull_client",
                ),
                ProjectCard(
                  projectName: "SpaceX test",
                  text: "AAAAAAAAA",
                  projectNameSnake: "spacex_test",
                ),
                ProjectCard(
                  projectName: "Coconut",
                  text: "AAAAAAAAA",
                  projectNameSnake: "coconut",
                ),
              ],
            )
          ],
        )),
        Container(
          padding: const EdgeInsets.all(15),
          color: Colors.transparent,
          child: IconButton(
            onPressed: () async {
              await ScreenController.zoomOf(context).toggle!();
            },
            icon: const Icon(Icons.menu),
          ),
        ),
      ],
    ));
  }
}
