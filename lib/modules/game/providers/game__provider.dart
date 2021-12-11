import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:test_window/Model/student.dart';
import 'package:test_window/modules/providers/main_provider.dart';

class GameProvider with ChangeNotifier {
  bool finishGame = false;
  List<Student> student = [
    Student("1;3;4;1"),
    Student("2;3;4;1"),
    Student("3;3;4;1"),
    Student("4;3;4;1"),
    Student("5;3;4;0"),
    Student("6;3;4;1"),
    Student("7;3;4;1"),
    Student("8;3;4;0"),
  ];
  late final Socket socket;
  GameProvider(MainPorovider porovider) {
    Future.delayed(Duration(minutes: 3), () {
      finishGame = true;
      notifyListeners();
    });

/*     this.socket = socket; */
  }
  wakeUpTheClient(String keyId, String response) {
    student.where((element) => element.keyId == keyId).forEach((element) {
      element.status = false;
    });
    notifyListeners();
  }

  initAsync() async {}
}
