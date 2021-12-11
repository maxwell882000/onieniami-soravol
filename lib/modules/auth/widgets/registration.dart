import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_window/Model/game.dart';
import 'package:test_window/global_widgets/main_scaffold.dart';
import 'package:test_window/global_widgets/text_field/abstracts/base_text_field.dart';
import 'package:test_window/global_widgets/text_field/implementations/text-field-password.dart';
import 'package:test_window/modules/buttons/implementations/black-button.dart';
import 'package:test_window/modules/buttons/implementations/red-button.dart';
import 'package:test_window/modules/game/widgets/initial_game.dart';
import 'package:test_window/modules/providers/main_provider.dart';

class Registation extends StatefulWidget {
  const Registation({Key? key}) : super(key: key);

  @override
  State<Registation> createState() => _RegistationState();
}

class _RegistationState extends State<Registation> {
  String name = "";
  final _formKey = GlobalKey<FormState>();

  String password = "";

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      child: Container(
          width: 300.0,
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Text(
                  "Register or Sign Up",
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
                    hintText: "Enter Login",
                    onSaved: (text) {
                      setState(() {
                        name = text!;
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
                      setState(() {
                        password = text!;
                      });
                    }),
                const SizedBox(
                  width: 200.0,
                  height: 30.0,
                ),
                Row(
                  children: [
                    Flexible(
                      child: RedButton(
                          text: 'Sign Up',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              print("${name};${password}");
                              final snackBar =
                                  SnackBar(content: Text('Sign up succefully'));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => InitialGame()
                                    ),
                              );
                              /*  final socket =
                                Provider.of<MainPorovider>(context).socket;
                            socket.write(); */
                              /*     Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => InitialGame()),
                            ); */

                            }
                          }),
                    ),
                    const SizedBox(
                      width: 10.0,
                      height: 30.0,
                    ),
                    Flexible(
                      child: BlackButton(
                        text: 'Sign In',
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            print("${name};${password}");
                            final snackBar =
                                SnackBar(content: Text('Sign in succefully'));
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => InitialGame()),
                            );
                            /*                     ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                             final socket =
                                Provider.of<MainPorovider>(context).socket;
                          /*   socket.write(); */
                                */
                          }
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
