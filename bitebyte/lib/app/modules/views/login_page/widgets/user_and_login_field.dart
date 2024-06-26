import 'package:bitebyte/app/modules/views/login_page/controller/login_controller.dart';
import 'package:bitebyte/app/modules/views/login_page/widgets/link_label.dart';
import 'package:bitebyte/app/core/ui/widgtes/default_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UserAndLoginField extends StatefulWidget {
  const UserAndLoginField({super.key});

  @override
  State<UserAndLoginField> createState() => _UserAndLoginFieldState();
}

class _UserAndLoginFieldState extends State<UserAndLoginField> {
  final controller = Modular.get<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DefaultTextFormField(
              labelText: 'Usuário',
              hintText: 'Digite seu usuário',
              prefixIconData: Icons.person,
              prefixIconColor: Colors.blueGrey,
              onChanged: (value) => controller.userName = value,
            ),
            const SizedBox(height: 20),
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
                  controller.isObscure
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: Colors.blueGrey,
                ),
              ),
              obscureText: controller.isObscure,
            ),
            const SizedBox(height: 15),
            LinkLabel(
              text: 'Esqueci minha senha',
              onPressed: () {},
              textColor: const Color.fromARGB(255, 33, 222, 243),
            ),
            const SizedBox(height: 5),
          ],
        );
      },
    );
  }
}
