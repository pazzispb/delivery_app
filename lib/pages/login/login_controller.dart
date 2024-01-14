import 'package:delivery_app/utils/shared_pref.dart';
import 'package:flutter/material.dart';

import '../../models/response_api.dart';
import '../../models/user.dart';
import '../../providers/user_provider.dart';

class LoginController{

  BuildContext? context;

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  UserProvider userProvider = UserProvider();

  SharedPref _sharedPref = SharedPref();

  Future? init(BuildContext context) async{
    this.context = context;
    await userProvider.init(context);

    User user = User.fromJson(await _sharedPref.read('user') ?? {});

    if(user?.sessionToken != null){
      Navigator.pushNamedAndRemoveUntil(context, 'client/products/list', (route) => false);
    }
    return null;
  }


  void goToRegisterPage(BuildContext context){
    Navigator.pushNamed(context, 'register');
  }

  void login() async{
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    ResponseApi? responseApi = await userProvider.login(email, password);
    if(responseApi?.succes == true){
      User user = User.fromJson(responseApi?.data);
      _sharedPref.save('user', user.toJson());
      Navigator.pushNamedAndRemoveUntil(context!, 'client/products/list', (route) => false);
    }

    print(responseApi?.message);
    print(responseApi?.toJson());

  }

}