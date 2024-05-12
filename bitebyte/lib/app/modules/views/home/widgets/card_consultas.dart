import 'package:bitebyte/app/modules/views/home/widgets/expanded_items.dart';
import 'package:bitebyte/app/modules/views/home/widgets/not_expanded_itens.dart';
import 'package:flutter/material.dart';

class CardConsultas extends StatefulWidget {
  const CardConsultas({super.key});

  @override
  State<CardConsultas> createState() => _CardConsultasState();
}

class _CardConsultasState extends State<CardConsultas> {
  bool isExpanded = false;
  bool isFirstTap = true;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 450),
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
            child:
                !isExpanded ? const NotExpandedItems() : const ExpandedItems(),
          ),
          if (isExpanded)
            Positioned(
              left: 10,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.print,
                  size: 24.0,
                ),
              ),
            ),
          if (isExpanded)
            const Positioned(
              top: 10,
              right: 10,
              child: Icon(
                Icons.arrow_drop_up,
                size: 24.0,
              ),
            )
          else
            const Positioned(
              top: 10,
              right: 10,
              child: Icon(
                Icons.arrow_drop_down,
                size: 24.0,
              ),
            ),
        ],
      ),
    );
  }
}
