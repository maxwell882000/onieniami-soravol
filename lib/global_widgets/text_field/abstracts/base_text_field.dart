import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_window/global_widgets/text_field/helper/sufix-container.dart';


class BaseTextField extends StatelessWidget {
  final String? hintText;
  final Function(String?)? onSaved;
  final String? Function(String?)? validatator;
  final String? sufixText;
  final bool isPassword;
  final bool autofocus;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Function? onTap;
  final SufixContainer? sufixContainer;

  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  const BaseTextField(
      {Key? key,
      this.maxLines = 1,
      this.onTap,
      this.controller,
      this.autofocus = false,
      this.inputFormatters,
      this.focusNode,
      this.isPassword = false,
      this.sufixContainer,
      this.sufixText,
      this.hintText,
      required this.validatator,
      required this.onSaved})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey),
        child: TextFormField(
          controller: controller,
          autofocus:autofocus ,
            onTap: () {
              if (onTap != null) onTap!();
            },
            inputFormatters: inputFormatters,
            focusNode: this.focusNode,
            cursorColor: Colors.grey.shade500,
            obscureText: isPassword,
            validator: validatator,
            maxLines: maxLines,
            onSaved: onSaved,
            decoration: InputDecoration(
                contentPadding: maxLines! > 1
                    ? EdgeInsets.symmetric(vertical: 10)
                    : EdgeInsets.zero,
                suffixIcon: sufixContainer,
                suffixIconConstraints: BoxConstraints(maxWidth: 100),
                hintText: hintText!,
                hintStyle: Theme.of(context).textTheme.bodyText1,
                border: InputBorder.none)));
  }
}
