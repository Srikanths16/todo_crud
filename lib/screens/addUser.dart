import 'package:crud/services/userService.dart';
import 'package:flutter/material.dart';

import '../model/User.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  var _userNameController = TextEditingController();
  var _userDescriptionController = TextEditingController();
  bool _validate = false;
  var _userService = UserService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("SQLite CRUD"),
        ),
        body: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Add New Details',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                      controller: _userNameController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: 'Enter Text',
                        labelText: 'Task Name',
                        errorText: _validate ? 'Value can\'t be Empty' : null,
                      )),
                  const SizedBox(
                    height: 30.0,
                  ),
                  TextField(
                      controller: _userDescriptionController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: 'Enter Description',
                        labelText: 'Description',
                      )),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      TextButton(
                          style: TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: Colors.blue,
                              textStyle: const TextStyle(fontSize: 15)),
                          onPressed: () async {
                            setState(() {
                              _userNameController.text.isEmpty
                                  ? _validate = true
                                  : _validate = false;
                            });

                            if (_validate == false) {
                              var _user = User();
                              _user.name = _userNameController.text;
                              _user.description =
                                  _userDescriptionController.text;
                              var result = await _userService.SaveUser(_user);
                              print(result);
                            }
                          },
                          child: const Text('Save Details')),
                      const SizedBox(
                        width: 20.0,
                      ),
                      TextButton(
                          style: TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: Colors.red,
                              textStyle: const TextStyle(fontSize: 15)),
                          onPressed: () {
                            _userDescriptionController.text = '';
                            _userNameController.text = '';
                          },
                          child: const Text('Clear Details'))
                    ],
                  )
                ],
              )),
        ));
  }
}
