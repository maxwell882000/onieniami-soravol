class Student {
  late String keyId;
  late String userId;
  late String gameId;
  late bool status;

  Student(String response) {
    List list = response.split(';');
    this.keyId = list[0];
    this.userId = list[1];
    this.gameId = list[2];
    this.status = list[3] == '1' ? true : false;
  }

  
}
