// ignore_for_file: file_names

import 'package:bitebyte/app/modules/views/animation_initial_page/controller/animation_controller.dart';
import 'package:bitebyte/app/modules/views/home/home_nome_rotas.dart';
import 'package:bitebyte/app/modules/views/login_page/login_nome_rotas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final controller = Modular.get<AnimatedInitialPageController>();

  @override
  void didChangeDependencies() async {
    controller.logged = await controller.login();
    Future.delayed(const Duration(seconds: 5), () {
      if (controller.logged) {
        Modular.to.navigate(
            '${HomeNomeRotas.modulo}${HomeNomeRotas.inicialProdutor}');
      } else {
        Modular.to.navigate('${LoginNomeRotas.modulo}${LoginNomeRotas.login}');
      }
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: const AssetImage('assets/gifs/gif_inicial.gif'),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
