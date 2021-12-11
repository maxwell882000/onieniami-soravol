import 'package:flutter/material.dart';
import 'package:test_window/global_widgets/text_field/abstracts/base_text_field.dart';
import 'package:test_window/global_widgets/text_field/helper/sufix-container.dart';

class TextFieldPassword extends StatefulWidget {
  final Function(String?)? onSaved;
  final String Function(String?)? validatator;
  final String? hintText;
  const TextFieldPassword(
      {Key? key, this.onSaved, this.validatator, this.hintText = "Password"})
      : super(key: key);
  @override
  _TextFieldPasswordState createState() => _TextFieldPasswordState();
}

class _TextFieldPasswordState extends State<TextFieldPassword> {
  bool show = true;
  @override
  Widget build(BuildContext context) {
    return BaseTextField(
      onSaved: widget.onSaved,
      validatator: widget.validatator,
      isPassword: show,
      hintText: widget.hintText,
      sufixContainer: SufixContainer(
        text: !show ? "Hide" : "Show",
        onClick: () {
          setState(() {
            show = !show;
          });
        },
      ),
    );
  }
}
