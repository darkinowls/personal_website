import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatelessWidget {
  final String projectName;
  final String text;
  final String projectNameSnake;

  const ProjectCard(
      {required this.projectName,
      required this.text,
      required this.projectNameSnake,
      Key? key})
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
                          Image.asset("assets/$projectNameSnake/1.webp",
                              width: 150),
                          Image.asset("assets/$projectNameSnake/2.webp",
                              width: 150),
                          Image.asset("assets/$projectNameSnake/3.webp",
                              width: 150),
                          Image.asset("assets/$projectNameSnake/4.webp",
                              width: 150),
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
                            padding: const EdgeInsets.all(15),
                            child: Text(text),
                          ),
                          _GithubButton(
                            projectNameSnake: projectNameSnake,
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
