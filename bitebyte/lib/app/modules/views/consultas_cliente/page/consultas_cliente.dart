import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ConsultasClientePage extends StatefulWidget {
  const ConsultasClientePage({super.key});

  @override
  State<ConsultasClientePage> createState() => _ConsultasClientePageState();
}

class _ConsultasClientePageState extends State<ConsultasClientePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consultas do Cliente'),
        centerTitle: true,
        actions: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.white,
              image: const DecorationImage(
                image: AssetImage('assets/imagens/logoapp.png'),
              ),
            ),
            margin: const EdgeInsets.only(right: 10),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
                Text(
                  DateFormat("dd/MM/yyyy").format(DateTime.now()),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.picture_as_pdf),
                ),
              ],
            ),
            const Text(
              'LIMPEZA',
              style:
                  TextStyle(fontSize: 18, decoration: TextDecoration.underline),
            ),
            const SizedBox(height: 40),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Professor responsável: Carlos Almeida da Silva Santos Antonio',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
