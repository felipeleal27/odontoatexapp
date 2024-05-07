import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotExpandedItems extends StatefulWidget {
  const NotExpandedItems({super.key});

  @override
  State<NotExpandedItems> createState() => _NotExpandedItemsState();
}

class _NotExpandedItemsState extends State<NotExpandedItems> {
  var date = DateFormat("dd/MM/yyyy").format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
