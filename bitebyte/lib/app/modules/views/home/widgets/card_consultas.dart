import 'package:bitebyte/app/modules/views/consultas_cliente/consultas_cliente_nome_rotas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
    return GestureDetector(
      onTap: () {
        Modular.to.pushNamed(
            '${ConsultasNomeRotas.modulo}${ConsultasNomeRotas.inicial}');
      },
      child: Container(
        padding: const EdgeInsets.all(6.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [Colors.blue[200]!, Colors.blue[400]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          border: Border.all(
            color: Colors.blue[700]!,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            const SizedBox(width: 8.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const ListTile(
                    leading: Icon(
                      Icons.person,
                    ),
                    title: Text(
                      'Professor: Carlos',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text('Aluno: Daniel', style: TextStyle()),
                  ),
                  const SizedBox(height: 10.0),
                  ListTile(
                    leading: const Icon(
                      Icons.calendar_today,
                    ),
                    title: Text(
                      'Data: $date',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle:
                        const Text('Procedimento: Limpeza', style: TextStyle()),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
