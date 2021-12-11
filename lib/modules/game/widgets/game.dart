import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_window/global_widgets/main_scaffold.dart';
import 'package:test_window/modules/buttons/implementations/red-button.dart';
import 'package:test_window/modules/game/providers/game__provider.dart';
import 'package:test_window/modules/game/widgets/initial_game.dart';
import 'package:test_window/modules/providers/main_provider.dart';

class Game extends StatelessWidget {
  const Game({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GameProvider>(
      create: (context) =>
          GameProvider(Provider.of<MainPorovider>(context, listen: false)),
      child: MainScaffold(
          child: Padding(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Consumer<MainPorovider>(builder: (context, provider, child) {
                  return Text(
                    "Your score  ${provider.user.score}",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  );
                }),
                Consumer<GameProvider>(
                  builder: (context, provider, child) {
                    return Visibility(
                      visible: !provider.finishGame,
                      child: SizedBox(
                        width: 200,
                        child: RedButton(
                          text: "Finish the game",
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => InitialGame()));
                          },
                        ),
                      ),
                    );
                  }
                ),
              ],
            ),
            Consumer<GameProvider>(builder: (context, provider, child) {
              return Wrap(
                spacing: 20,
                children: provider.student
                    .map<Widget>((e) => Consumer<GameProvider>(
                            builder: (context, provider, child) {
                          return GestureDetector(
                            onTap: () {
                              provider.wakeUpTheClient(e.keyId, "asdsad");
                            },
                            child: Container(
                              width: 200,
                              margin: EdgeInsets.symmetric(vertical: 10),
                              height: 200,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  color: Colors.orange.shade200,
                                  image: DecorationImage(
                                      image: ExactAssetImage(e.status
                                          ? "assets/images/sleeping.png"
                                          : "assets/images/listening.png"))),
                            ),
                          );
                        }))
                    .toList(),
              );
            }),
          ],
        ),
      )),
    );
  }
}
