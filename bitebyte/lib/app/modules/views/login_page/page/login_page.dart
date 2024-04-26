import 'package:bitebyte/app/modules/views/login_page/controller/login_controller.dart';
import 'package:bitebyte/app/modules/views/login_page/widgets/form_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = Modular.get<LoginController>();

  @override
  Widget build(BuildContext context) {
    final tamanhoTela = MediaQuery.of(context).size;
    return Observer(
      builder: (_) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(),
              width: tamanhoTela.width,
              height: tamanhoTela.height,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [_avatarLogin(tamanhoTela), const FormLogin()],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _avatarLogin(Size tamanhoTela) {
    return Container(
      height: 130,
      width: 130,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/imagens/logoapp.png'),
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(100),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 5,
          ),
        ],
      ),
      margin: EdgeInsets.only(
        top: tamanhoTela.height.h * 0.1,
        bottom: tamanhoTela.height.h * 0.1,
      ),
    );
  }
}
