import 'package:crud/db/repository.dart';
import 'package:crud/model/User.dart';

class UserService {
  late Repository _repository;
  UserService() {
    _repository = Repository();
  }

  //Save User
  SaveUser(User user) async {
    return await _repository.insertData("user", user.userMap());
  }

  //Read all User
  readAllUsers() async {
    return await _repository.readData('user');
  }
}
