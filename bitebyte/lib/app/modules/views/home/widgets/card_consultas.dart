import 'package:bitebyte/app/core/ui/widgtes/messages.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardConsultas extends StatefulWidget {
  const CardConsultas({super.key});

  @override
  State<CardConsultas> createState() => _CardConsultasState();
}

class _CardConsultasState extends State<CardConsultas> {
  var date = DateFormat("dd/MM/yyyy").format(DateTime.now());
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        setState(() {
          !isExpanded
              ? CustomSnackbar.info(
                  context, 'Toque duas vezes para expandir a consulta.')
              : null;
          isExpanded = !isExpanded;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        width: size.width,
        height: isExpanded ? size.height / 2.2 : size.height / 5,
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
                      Icons.picture_as_pdf,
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
