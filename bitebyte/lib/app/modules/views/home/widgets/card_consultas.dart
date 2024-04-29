import 'package:flutter/material.dart';

class CardConsultas extends StatefulWidget {
  const CardConsultas({super.key});

  @override
  State<CardConsultas> createState() => _CardConsultasState();
}

class _CardConsultasState extends State<CardConsultas> {
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
          Container(
            width: MediaQuery.of(context).size.height / 12,
            height: MediaQuery.of(context).size.height / 12,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              image: const DecorationImage(
                image: AssetImage('assets/imagens/denteLogo.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'DATA: 29/04',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('Procedimento: Limpeza'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
