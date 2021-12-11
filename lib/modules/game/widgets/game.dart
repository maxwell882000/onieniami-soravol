import 'package:flutter/material.dart';
import 'package:test_window/global_widgets/main_scaffold.dart';

class Game extends StatelessWidget {
  const Game({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
        child: Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: Colors.orange.shade200,
          image: DecorationImage(
              image: ExactAssetImage("assets/images/listening.png"))),
    ));
  }
}
