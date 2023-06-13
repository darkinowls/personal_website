import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Console extends StatelessWidget {
  const Console({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: 400,
      height: 300,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Color.fromRGBO(33, 37, 43, 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 10,
              spreadRadius: 1,
            )
          ]),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_ConsoleHeader(), _ConsoleBody()],
      ),
    );
  }
}

class _ConsoleHeader extends StatelessWidget {
  const _ConsoleHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(51, 51, 51, 1),
      height: 50,
      child: Row(
        children: [
          SizedBox(width: 25),
          Column(
            children: [
              const Spacer(),
              Container(
                width: 200,
                height: 30,
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(33, 37, 43, 1),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                    )),
                child: const Row(
                  children: [
                    FaIcon(FontAwesomeIcons.terminal, size: 12),
                    SizedBox(width: 5),
                    Text("denys@Aspire"),
                    Spacer(),
                    Icon(Icons.close, size: 14)
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          const SizedBox(
            width: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.remove, size: 14),
                Icon(Icons.square_outlined, size: 14),
                Icon(Icons.close, size: 14),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ConsoleBody extends StatefulWidget {
  const _ConsoleBody({Key? key}) : super(key: key);

  @override
  State<_ConsoleBody> createState() => _ConsoleBodyState();
}

class _ConsoleBodyState extends State<_ConsoleBody> {
  bool startSecondLine = false;
  bool startThirdLine = false;
  bool startForthLine = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(children: [
            const _ConsoleLogin(),
            AnimatedTextKit(
              isRepeatingAnimation: false,
              animatedTexts: [
                TypewriterAnimatedText("Hello, my name is Denys",
                    speed: const Duration(milliseconds: 250),
                    cursor: "|",
                    curve: Curves.easeInOut),
              ],
              onFinished: () => setState(() => startSecondLine = true),
            ),
          ]),
          Visibility(
            visible: startSecondLine,
            child: Row(
              children: [
                const _ConsoleLogin(),
                AnimatedTextKit(
                  isRepeatingAnimation: false,
                  animatedTexts: [
                    FadeAnimatedText(
                      "|",
                      duration: const Duration(milliseconds: 50),
                      fadeInEnd: 0,
                      fadeOutBegin: 1,
                    ),
                    TypewriterAnimatedText("And I'm a",
                        speed: const Duration(milliseconds: 250), cursor: "|"),
                  ],
                  onFinished: () => setState(() => startThirdLine = true),
                ),
              ],
            ),
          ),
          Visibility(
            visible: startThirdLine,
            child: Row(
              children: [
                const _ConsoleLogin(),
                AnimatedTextKit(
                  isRepeatingAnimation: false,
                  animatedTexts: [
                    FadeAnimatedText("|",
                        duration: const Duration(milliseconds: 50),
                        fadeInEnd: 0,
                        fadeOutBegin: 1),
                    TypewriterAnimatedText("Flutter developer",
                        speed: const Duration(milliseconds: 0)),
                    TypewriterAnimatedText("Python developer",
                        speed: const Duration(milliseconds: 0)),
                    TypewriterAnimatedText("Software engineer",
                        speed: const Duration(milliseconds: 0)),
                  ],
                  onFinished: () => setState(() => startForthLine = true),
                ),
              ],
            ),
          ),
          Visibility(
            visible: startForthLine,
            child: Row(
              children: [
                const _ConsoleLogin(),
                AnimatedTextKit(
                  repeatForever: true,
                  pause: const Duration(milliseconds: 0),
                  animatedTexts: [
                    FadeAnimatedText("|",
                        duration: const Duration(milliseconds: 1000),
                        fadeOutBegin: 0.8,
                        fadeInEnd: 0.2),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ConsoleLogin extends StatelessWidget {
  const _ConsoleLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Row(
        children: [
          Text("denys@Aspire", style: TextStyle(color: Colors.teal)),
          Text(":", style: TextStyle(color: Colors.white)),
          Text(
            "~",
            style: TextStyle(color: Colors.blue),
          ),
          Text("\$ ", style: TextStyle(color: Colors.white)),
        ],
      );
}
