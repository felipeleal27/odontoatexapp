import 'package:bitebyte/app/app_module.dart';
import 'package:bitebyte/app/app_widget.dart';
import 'package:bitebyte/app/core/helpers/environments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

Future<void> main() async {
  await Environments.loadEnvs();
  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
