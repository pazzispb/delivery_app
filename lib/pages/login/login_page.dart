import 'package:delivery_app/pages/login/login_controller.dart';
import 'package:delivery_app/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Crear un objeto de la clase LoginController
  LoginController _controller = LoginController();

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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //_imageBanner(context),
            _loginAnimation(context),
            _textFieldEmail(),
            _textFieldPassword(),
            _buttonLogin(),
            _textDontHaveAccount(),
          ],
        ),
      ),
    );
  }

  Row _textDontHaveAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'No tienes cuenta?',
          style: TextStyle(color: MyColors.primaryColor),
        ),
        const SizedBox(
          width: 7,
        ),
        GestureDetector(
          onTap: () {
            _controller.goToRegisterPage(context);
          },
          child: Text(
            'Registrate',
            style: TextStyle(
                color: MyColors.primaryColor, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget _buttonLogin() {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
        child: ElevatedButton(
          onPressed: () {
            _controller.login();
          },
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40))),
          child: const Text('Login'),
        ));
  }

  Container _textFieldEmail() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
          color: MyColors.primaryColorOpacity,
          borderRadius: BorderRadius.circular(40)),
      child: TextField(
        controller: _controller.emailController,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Correo electronico',
            hintStyle: TextStyle(color: MyColors.primaryColorDark),
            prefixIcon: Icon(
              Icons.email,
              color: MyColors.primaryColor,
            )),
      ),
    );
  }

  Container _textFieldPassword() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
          color: MyColors.primaryColorOpacity,
          borderRadius: BorderRadius.circular(40)),
      child: TextField(
        controller: _controller.passwordController,
        obscureText: true,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Contraseña',
            hintStyle: TextStyle(color: MyColors.primaryColorDark),
            prefixIcon: Icon(
              Icons.email,
              color: MyColors.primaryColor,
            )),
      ),
    );
  }

  Container _imageBanner(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.22, bottom: 50),
      child: Image.asset(
        'assets/images/delivery.png',
        width: 200,
        height: 200,
      ),
    );
  }

  Container _loginAnimation(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.22, bottom: 50),
      child: Lottie.asset('assets/json/delivery.json'),
    );
  }
}
