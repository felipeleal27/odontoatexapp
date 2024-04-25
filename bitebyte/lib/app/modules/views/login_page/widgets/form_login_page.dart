import 'package:bitebyte/app/modules/views/login_page/widgets/user_and_login_field.dart';
import 'package:flutter/material.dart';

class FormLoginPage extends StatefulWidget {
  const FormLoginPage({Key? key}) : super(key: key);

  @override
  State<FormLoginPage> createState() => _FormLoginPageState();
}

class _FormLoginPageState extends State<FormLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 30, 90, 140),
                Colors.black,
                Colors.blue.shade700,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.all(20.0),
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
        const SizedBox(height: 20),
        const Expanded(
          child: Center(
            child: UserAndLoginField(),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0),
            child: Text('ENTRAR'),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
