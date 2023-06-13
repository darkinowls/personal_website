import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

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
        boxShadow: [BoxShadow(
          color: Colors.black,
          blurRadius: 10,
          spreadRadius: 1,
        )

        ]

      ),
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
          Container(
            width: 200,
            height: 50,
            decoration: const BoxDecoration(
                color: Color.fromRGBO(33, 37, 43, 1),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                )),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(
                  Icons.calculate_outlined,
                  size: 12,
                ),
                Text("denys@Aspire"),
                Icon(Icons.close, size: 14)
              ],
            ),
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

class _ConsoleBody extends StatelessWidget {
  const _ConsoleBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(children: [
            const Text("denys@Aspire", style: TextStyle(color: Colors.teal)),
            const Text(":", style: TextStyle(color: Colors.white)),
            const Text(
              "~",
              style: TextStyle(color: Colors.blue),
            ),
            const Text("\$ ", style: TextStyle(color: Colors.white)),
            AnimatedTextKit(
              isRepeatingAnimation: false,
              animatedTexts: [
                TypewriterAnimatedText("Hello, My name is Denys ",
                    speed: const Duration(milliseconds: 250), cursor: "|"),
              ],
            ),
          ]),
        ],
      ),
    );
  }
}
