import 'package:bitebyte/app/modules/views/login_page/controller/login_controller.dart';
import 'package:bitebyte/app/modules/views/login_page/widgets/link_label.dart';
import 'package:bitebyte/widgtes/default_text_form_field/default_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FormLoginPage extends StatefulWidget {
  const FormLoginPage({Key? key}) : super(key: key);

  @override
  State<FormLoginPage> createState() => _FormLoginPageState();
}

class _FormLoginPageState extends State<FormLoginPage> {
  final controller = Modular.get<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 30, 90, 140),
                Colors.black,
                Colors.blue.shade700,
              ],
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          // padding: const EdgeInsets.all(20.0),
          child: const Center(
            child: Text(
              'FAÇA LOGIN',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        // const SizedBox(height: 20),
        DefaultTextFormField(
          labelText: 'Usuário',
          hintText: 'Digite seu usuário',
          prefixIconData: Icons.person,
          prefixIconColor: Colors.blueGrey,
          onChanged: (value) => controller.userName = value,
        ),
        // const SizedBox(height: 20),
        DefaultTextFormField(
          labelText: 'Senha',
          hintText: 'Digite sua senha',
          onChanged: (value) => controller.password = value,
          prefixIconData: Icons.lock,
          prefixIconColor: Colors.blueGrey,
          suffixIconButton: IconButton(
            onPressed: () {
              controller.changeObscure();
            },
            icon: Icon(
              controller.isObscure ? Icons.visibility : Icons.visibility_off,
              color: Colors.blueGrey,
            ),
          ),
          obscureText: controller.isObscure,
        ),
        // const SizedBox(height: 15),
        LinkLabel(
          text: 'Esqueci minha senha',
          onPressed: () {},
          textColor: const Color.fromARGB(255, 33, 222, 243),
        ),
        // const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            controller.login();
          },
          child: Text('ENTRAR'),
        ),
        // const SizedBox(height: 20),
      ],
    );
  }
}
