import 'package:delivery_app/pages/client/products/list/client_products_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ClientProductsListPage extends StatefulWidget {
  const ClientProductsListPage({super.key});

  @override
  State<ClientProductsListPage> createState() => _ClientProductsListPageState();
}

class _ClientProductsListPageState extends State<ClientProductsListPage> {
  ClientProductsListController _controller = ClientProductsListController();

  @override
  void initState() {
    // TODO: implement initState
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _controller.init(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: ElevatedButton(onPressed: (){
      _controller.logout();
    }, child: Text('Logout')));
  }
}
