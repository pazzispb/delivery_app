import 'package:delivery_app/providers/user_provider.dart';
import 'package:flutter/material.dart';

import '../../models/response_api.dart';
import '../../models/user.dart';

class RegisterController {
  BuildContext? context;

  TextEditingController nameController = TextEditingController();


  TextEditingController lastNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController telephoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  UserProvider userProvider = UserProvider();


  Future? init(BuildContext context) {
    this.context = context;
    userProvider.init(context);
  }

  void goToLoginPage(BuildContext context) {
    Navigator.pushNamed(context, 'login');
  }

  void register() async {
    String name = nameController.text.trim();
    String lastName = lastNameController.text.trim();
    String email = emailController.text.trim();
    String telephone = telephoneController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    User user = User(
      email: email,
      name: name,
      lastname: lastName,
      phone: telephone,
      password: password
    );

    ResponseApi? res = await userProvider.createUser(user);
    print("Respuesta: ${res?.toJson()}");

  }
}
