import 'dart:io';

import 'package:flutter/cupertino.dart';

class RegistrationProvider with ChangeNotifier {
  final Socket socket;
  RegistrationProvider(this.socket);
  // sendRegister() {
  //   socket.write(object);
  // }
}
