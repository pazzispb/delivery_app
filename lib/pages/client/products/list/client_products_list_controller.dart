import 'package:delivery_app/utils/shared_pref.dart';
import 'package:flutter/cupertino.dart';

class ClientProductsListController{

  BuildContext? context;
  SharedPref sharedPref = SharedPref();

  Future? init(BuildContext context){
    this.context = context;
    return null;
  }

  void logout(){
    sharedPref.logout(context!);
  }
}