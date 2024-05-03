import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardConsultas extends StatefulWidget {
  const CardConsultas({super.key});

  @override
  State<CardConsultas> createState() => _CardConsultasState();
}

class _CardConsultasState extends State<CardConsultas> {
  var date = DateFormat("dd/MM/yyyy").format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue[200],
      ),
      child: Row(
        children: [
          // Container(
          //   width: MediaQuery.of(context).size.height / 12,
          //   height: MediaQuery.of(context).size.height / 12,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(6),
          //     image: const DecorationImage(
          //       image: AssetImage('assets/imagens/denteLogo.png'),
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // ),

          const SizedBox(width: 8.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                  leading: const Icon(Icons.archive_outlined),
                  title: Text(
                    'DATA: $date',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text('Procedimento: Limpeza'),
                ),
                const ListTile(
                  leading: Icon(Icons.person),
                  title: Text(
                    'PROFESSOR: Carlos',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('Aluno: Daniel'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
