import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:test_window/modules/auth/widgets/registration.dart';
import 'package:test_window/modules/game/widgets/initial_game.dart';
import 'package:test_window/modules/providers/main_provider.dart';

import 'modules/game/widgets/game.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MainPorovider(),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MyHomePage(
            title: "ASDASD",
          )),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return MainPorovider();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "ASDSDSD ",
              ),
              Consumer<MainPorovider>(builder: (context, provider, child) {
                return Text(
                  provider.counter.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              }),
              Consumer<MainPorovider>(builder: (context, provider, child) {
                return FloatingActionButton(
                  onPressed: () async {
                    provider.counter += 1;
                    provider.socket.write('asdsad');
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                );
              }),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
