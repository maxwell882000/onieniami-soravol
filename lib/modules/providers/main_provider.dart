import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';

class MainPorovider with ChangeNotifier {
  bool _isConnected = false;
  int _counter = 0;

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
  socketListen(Function listen) {
    socket.listen(
      (Uint8List data) {
        final serverResponse = String.fromCharCodes(data);
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
/*     _socket = await Socket.connect('localhost', 9999); */
    isConnected = true;
  }
}
