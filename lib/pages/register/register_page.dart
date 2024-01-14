import 'package:delivery_app/pages/register/register_controller.dart';
import 'package:delivery_app/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterController _controller = RegisterController();

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
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 40),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: IconButton(
                          onPressed: () {
                            _controller.goToLoginPage(context);
                          },
                          icon: const Icon(Icons.arrow_back)),
                    ),
                  ],
                ),
                _userAvatar(),
                _textFieldName(),
                _textFieldLastName(),
                _textFieldEmail(),
                _textFieldTelephone(),
                _textFieldPassword(),
                _textFieldConfirmPassword(),
                _buttonRegister(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _textFieldName() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
        color: MyColors.primaryColorOpacity,
        borderRadius: BorderRadius.circular(40),
      ),
      child: TextField(
        controller: _controller.nameController,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Nombre',
          hintStyle: TextStyle(color: MyColors.primaryColorDark),
          prefixIcon: Icon(Icons.person, color: MyColors.primaryColor),
        ),
      ),
    );
  }

  Widget _textFieldLastName() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
        color: MyColors.primaryColorOpacity,
        borderRadius: BorderRadius.circular(40),
      ),
      child: TextField(
        controller: _controller.lastNameController,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Apellido',
          hintStyle: TextStyle(color: MyColors.primaryColorDark),
          prefixIcon: Icon(Icons.person, color: MyColors.primaryColor),
        ),
      ),
    );
  }

  Widget _textFieldEmail() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
        color: MyColors.primaryColorOpacity,
        borderRadius: BorderRadius.circular(40),
      ),
      child: TextField(
        controller: _controller.emailController,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Email',
          hintStyle: TextStyle(color: MyColors.primaryColorDark),
          prefixIcon: Icon(Icons.email, color: MyColors.primaryColor),
        ),
      ),
    );
  }

  Widget _textFieldTelephone() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
        color: MyColors.primaryColorOpacity,
        borderRadius: BorderRadius.circular(40),
      ),
      child: TextField(
        controller: _controller.telephoneController,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Teléfono',
          hintStyle: TextStyle(color: MyColors.primaryColorDark),
          prefixIcon: Icon(Icons.phone, color: MyColors.primaryColor),
        ),
      ),
    );
  }

  Widget _textFieldPassword() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
        color: MyColors.primaryColorOpacity,
        borderRadius: BorderRadius.circular(40),
      ),
      child: TextField(
        controller: _controller.passwordController,
        obscureText: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Contraseña',
          hintStyle: TextStyle(color: MyColors.primaryColorDark),
          prefixIcon: Icon(Icons.password, color: MyColors.primaryColor),
        ),
      ),
    );
  }

  Widget _textFieldConfirmPassword() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
        color: MyColors.primaryColorOpacity,
        borderRadius: BorderRadius.circular(40),
      ),
      child: TextField(
        controller: _controller.confirmPasswordController,
        obscureText: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Confirmar contraseña',
          hintStyle: TextStyle(color: MyColors.primaryColorDark),
          prefixIcon: Icon(Icons.password, color: MyColors.primaryColor),
        ),
      ),
    );
  }

  Widget _buttonRegister() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        onPressed: () {
          _controller.register();
        },
        child: const Text('Registrarse'),
      ),
    );
  }

  Widget _userAvatar() {
    return Container(
      child: CircleAvatar(
        backgroundColor: Colors.grey.shade200,
        radius: 75,
        backgroundImage: const AssetImage('assets/images/user_profile.png'),
      ),
    );
  }
}
