import 'dart:html';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../custom_widgets/hero_dialog_route.dart';

class ProjectCard extends StatelessWidget {
  final String projectName;
  final String text;
  final String githubProjectNameSnake;

  final String? anotherTitle;

  final String? anotherLink;

  const ProjectCard(
      {required this.projectName,
      required this.text,
      required this.githubProjectNameSnake,
      Key? key,
      this.anotherTitle,
      this.anotherLink})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Text(projectName, style: const TextStyle(fontSize: 24)),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.center,
                  children: [
                    SizedBox(
                      width: 320,
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          for (int i = 1; i <= 4; i++)
                            _TouchableImage(
                                imagePath:
                                    "assets/$githubProjectNameSnake/$i.webp"),
                        ],
                      ),
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                          minWidth: 200, maxWidth: 250, minHeight: 300),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(25),
                            child: Text(text),
                          ),
                          _GithubButton(
                            projectNameSnake: githubProjectNameSnake,
                          ),
                          if (anotherTitle != null && anotherLink != null)
                            const SizedBox(height: 25),
                          if (anotherTitle != null && anotherLink != null)
                            _AnotherButton(
                              title: anotherTitle!,
                              link: anotherLink!,
                            )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _TouchableImage extends StatelessWidget {
  final String imagePath;

  const _TouchableImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, HeroDialogRoute(
          builder: (context) {
            return Dialog(
              backgroundColor: Colors.transparent,
              elevation: 0,
              child: Hero(
                  transitionOnUserGestures: true,
                  tag: imagePath,
                  child: Image.asset(imagePath, width: 250)),
            );
          },
        ));
      },
      child: Hero(
        tag: imagePath,
        child: Image.asset(imagePath, width: 150),
      ),
    );
  }
}

class _GithubButton extends StatelessWidget {
  final String projectNameSnake;

  const _GithubButton({Key? key, required this.projectNameSnake})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const ShapeDecoration(
          shape: StadiumBorder(),
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Colors.yellow,
                Colors.teal,
              ])),
      child: ElevatedButton(
          onPressed: () => launchUrl(
              Uri.parse("https://github.com/Darkinowls/$projectNameSnake")),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          child: const Text(
            "Find on Github",
            style: TextStyle(color: Colors.black),
          )),
    );
  }
}

class _AnotherButton extends StatelessWidget {
  final String title;
  final String link;

  const _AnotherButton({super.key, required this.title, required this.link});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const ShapeDecoration(
          shape: StadiumBorder(),
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Colors.blueAccent,
                Colors.yellow,
              ])),
      child: ElevatedButton(
          onPressed: () => launchUrl(Uri.parse(link)),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          child: Text(
            title,
            style: const TextStyle(color: Colors.black),
          )),
    );
  }
}
