import 'package:flutter/material.dart';

class MainScaffold extends StatelessWidget {
  const MainScaffold({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.purple,
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}
