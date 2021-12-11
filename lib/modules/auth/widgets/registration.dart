import 'dart:io';

import 'package:flutter/material.dart';
import 'package:test_window/Model/game.dart';
import 'package:test_window/global_widgets/main_scaffold.dart';
import 'package:test_window/global_widgets/text_field/abstracts/base_text_field.dart';
import 'package:test_window/global_widgets/text_field/implementations/text-field-password.dart';
import 'package:test_window/modules/buttons/implementations/black-button.dart';
import 'package:test_window/modules/buttons/implementations/red-button.dart';
import 'package:test_window/modules/game/widgets/initial_game.dart';

class Registation extends StatefulWidget {
  const Registation({Key? key}) : super(key: key);

  @override
  State<Registation> createState() => _RegistationState();
}

class _RegistationState extends State<Registation> {
  String? ss;
  final _formKey = GlobalKey<FormState>();
  String? dd;
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
                      return "";
                    },
                    hintText: "Enter Login",
                    onSaved: (text) {
                      setState(() {
                        ss = text;
                      });
                    }),
                const SizedBox(
                  width: 200.0,
                  height: 30.0,
                ),
                TextFieldPassword(
                    validatator: (text) {
                      return "";
                    },
                    hintText: "Enter Password",
                    onSaved: (text) {
                      setState(() {
                        dd = text;
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
                            final snackBar =
                                SnackBar(content: Text('Sign up succefully'));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                            final socket = Socket.connect('185.74.5.208', 9999);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => InitialGame()),
                            );
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
                          final snackBar =
                              SnackBar(content: Text('Sign in succefully'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => InitialGame()));
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
