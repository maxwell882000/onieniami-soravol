import 'package:flutter/material.dart';
import 'package:test_window/global_widgets/main_scaffold.dart';

class Registation extends StatelessWidget {
  const Registation({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      child: Container(
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Form(
          child: Column(children: [
            
          ],),
        )),
    );
  }
}