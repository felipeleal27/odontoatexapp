import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeAgendasPage extends StatefulWidget {
  const HomeAgendasPage({super.key});

  @override
  State<HomeAgendasPage> createState() => _HomeAgendasPageState();
}

class _HomeAgendasPageState extends State<HomeAgendasPage> {
  @override
  Widget build(BuildContext context) {
    var date = DateFormat("dd/mm/yyyy").format(DateTime.now());
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Material(
            elevation: 8.0,
            borderRadius: BorderRadius.circular(4),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.grey[200],
              ),
              child: Card(
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Center(
                              child: Text(
                                date,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                            const Center(
                              child: Text(
                                "Horários disponíveis",
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.edit,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Card(
            child: ListTile(
              title: Text('Horário: 07:30'),
              subtitle: Text('Aluno: Daniel - Professor: Carlos'),
            ),
          )
        ],
      ),
    );
  }
}
