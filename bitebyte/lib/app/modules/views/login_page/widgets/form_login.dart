import 'package:bitebyte/app/core/ui/widgtes/container_default_button.dart';
import 'package:bitebyte/app/modules/views/login_page/controller/login_controller.dart';
import 'package:bitebyte/app/modules/views/login_page/widgets/link_label.dart';
import 'package:bitebyte/app/core/ui/widgtes/default_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({super.key});

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final controller = Modular.get<LoginController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Observer(
      builder: (_) {
        return Column(
          children: [
            DefaultTextFormField(
              labelText: 'Usuário',
              hintText: 'Digite seu usuário',
              prefixIconData: Icons.person,
              prefixIconColor: Colors.blueGrey,
              onChanged: (value) => controller.userName = value,
            ),
            SizedBox(height: size.height.h / 40),
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
              clickButton: () => controller
                  .login(), // passar a função que quer que faça ao clicar "ok" no teclado
            ),
            SizedBox(height: size.height.h / 100),
            Row(
              children: [
                Observer(
                  builder: (_) {
                    return Checkbox(
                        value: controller.savePassword,
                        onChanged: (_) {
                          controller.changeSavePassword();
                        });
                  },
                ),
                Text('Lembrar senha', style: TextStyle(fontSize: 12.sp)),
                const Spacer(),
                LinkLabel(
                  text: 'Esqueci minha senha',
                  onPressed: () {},
                  textColor: const Color.fromARGB(255, 0, 81, 187),
                  fontSize: 13.sp,
                  // textColor: const Color.fromARGB(255, 33, 222, 243),
                ),
              ],
            ),
            SizedBox(height: size.height.h / 20),
            ContainerDefaultButton(
              text: 'Entrar',
              onTap: () {
                FocusScope.of(context).unfocus();
                controller.login();
              },
              circularProgressIndicator: controller.isLoading,
            ),
          ],
        );
      },
    );
  }
}
