import 'package:flutter/material.dart';

class MainScaffold extends StatelessWidget {
  const MainScaffold({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    /*   appBar: AppBar(
        leading: IconButton(
          onPressed: () {

          },
          icon: Icon(Icons.menu),
        ),
      ), */
      body: Container(
        color: Colors.purple,
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}
