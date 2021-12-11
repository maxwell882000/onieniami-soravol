import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:test_window/Model/user.dart';
import 'package:test_window/modules/providers/serialize.dart';

class MainPorovider extends Serializer with ChangeNotifier {
  bool _isConnected = false;
  int _counter = 0;
  User user = new User();
  int get counter => _counter;

  set counter(int counter) {
    _counter = counter;
    notifyListeners();
  }

  bool get isConnected => _isConnected;

  set isConnected(bool isConnected) {
    _isConnected = isConnected;
    notifyListeners();
  }

  late Socket _socket;

  Socket get socket => _socket;

  set socket(Socket socket) {
    _socket = socket;
    notifyListeners();
  }

  MainPorovider() {
    initializeSocket();
  }
  socketListen() {
    _socket.listen(
      (Uint8List data) {
        final serverResponse = String.fromCharCodes(data);
        print(serverResponse);
      },
      onError: (error) {
        print(error);
        socket.destroy();
      },
      onDone: () {
        print('Server left.');
        socket.destroy();
      },
    );
  }

  initializeSocket() async {
    print("INITIALIZED");
    _socket = await Socket.connect('127.0.0.1', 9999);
    socketListen();
    /*   socketListen(() {});
    _socket.write('0;bekzod;password'); */
    isConnected = true;
  }
}
