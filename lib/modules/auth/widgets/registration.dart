import 'package:flutter/material.dart';
import 'package:test_window/global_widgets/main_scaffold.dart';
import 'package:test_window/global_widgets/text_field/abstracts/base_text_field.dart';
import 'package:test_window/modules/buttons/implementations/black-button.dart';
import 'package:test_window/modules/buttons/implementations/red-button.dart';

class Registation extends StatelessWidget {
  const Registation({Key? key}) : super(key: key);

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
            child: Column(
              children: [
                Text(
                  "Registration",
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
                    onSaved: (text) {}),
                const SizedBox(
                  width: 200.0,
                  height: 30.0,
                ),
                BaseTextField(
                    validatator: (text) {
                      return "";
                    },
                    hintText: "Enter Password",
                    onSaved: (text) {}),
              ],
            ),
            Row(
              children: [
              RedButton('Sign Up'),
              BlackButton('Sign In'),
            ],
            )
          )
          ),
    );
  }
}
