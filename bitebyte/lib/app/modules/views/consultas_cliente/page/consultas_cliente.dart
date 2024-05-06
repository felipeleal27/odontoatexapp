import 'package:flutter/material.dart';

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
      ),
      body: Container(
        child: const Center(
          child: Text('Página de Consultas do Cliente'),
        ),
      ),
    );
  }
}
