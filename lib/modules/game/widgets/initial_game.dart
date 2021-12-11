import 'package:flutter/material.dart';
import 'package:test_window/global_widgets/main_scaffold.dart';
import 'package:test_window/global_widgets/text_field/abstracts/base_text_field.dart';
import 'package:test_window/global_widgets/text_field/implementations/text-field-password.dart';
import 'package:test_window/modules/buttons/implementations/black-button.dart';
import 'package:test_window/modules/buttons/implementations/red-button.dart';

import 'game.dart';

class InitialGame extends StatefulWidget {
  const InitialGame({Key? key}) : super(key: key);

  @override
  State<InitialGame> createState() => _InitialGameState();
}

class _InitialGameState extends State<InitialGame> {
  String gameId = "";
  final _formKey = GlobalKey<FormState>();
  String password = "";
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      child: Container(
        width: 300.0,
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Text(
                "Create or Join",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                width: 200.0,
                height: 30.0,
              ),
              BaseTextField(
                  validatator: (text) {
                    return null;
                  },
                  hintText: "Game ID",
                  onSaved: (text) {
                    setState(() {
                      gameId = text!;
                    });
                  }),
              const SizedBox(
                width: 200.0,
                height: 30.0,
              ),
              TextFieldPassword(
                  validatator: (text) {
                    return null;
                  },
                  hintText: "Enter Password",
                  onSaved: (text) {
                    password = text!;
                  }),
              const SizedBox(
                width: 200.0,
                height: 30.0,
              ),
              Row(
                children: [
                  Flexible(
                    child: RedButton(
                        text: 'Join the game',
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            print("${gameId};${password}");
                            final snackBar =
                                SnackBar(content: Text('Joined to the game'));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Game()));
                          }
                        }),
                  ),
                  const SizedBox(
                    width: 10.0,
                    height: 30.0,
                  ),
                  Flexible(
                    child: BlackButton(
                      text: 'Create the game',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          print("${gameId};${password}");
                          final snackBar =
                              SnackBar(content: Text('Created to the game'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Game()));
                        }
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
