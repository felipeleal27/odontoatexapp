import 'package:bitebyte/app/core/ui/widgtes/default_check_button.dart';
import 'package:bitebyte/app/core/ui/widgtes/default_radio_button.dart';
import 'package:bitebyte/app/modules/views/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

class FiltrarTile extends StatefulWidget {
  const FiltrarTile({super.key});

  @override
  State<FiltrarTile> createState() => _FiltrarTileState();
}

class _FiltrarTileState extends State<FiltrarTile> {
  final controller = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        filtrar(context);
      },
      child: ListTile(
        title: Container(
          // height: size.height / 12,
          // width: size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Observer(
            builder: (_) {
              return ListTile(
                leading: const Icon(Icons.filter_alt_outlined),
                title: Text(
                  controller.listFiltro.isEmpty ? 'Filtrar' : 'Filtros:',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: controller.listFiltro.isNotEmpty
                    ? Column(
                        children: controller.listFiltro.map((element) {
                          return Row(
                            children: [
                              Text(element),
                              element == "Data"
                                  ? Text(
                                      ' - ${controller.dataInicial} - ${controller.dataFinal}')
                                  : element == "Professor"
                                      ? Text(' - ${controller.professor}')
                                      : Text(' - ${controller.procedimento}'),
                            ],
                          );
                        }).toList(),
                      )
                    : null,
              );
            },
          ),
        ),
        // trailing: IconButton(
        //   icon: const Icon(Icons.filter_alt_outlined),
        //   onPressed: () {
        //     filtrar(context);
        //   },
        // ),
      ),
    );
  }

  void filtrar(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Filtrar'),
              content: Observer(builder: (_) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DefaultCheckButton(
                      title: 'Data',
                      value: 'Option 1',
                      icon: Icons.calendar_month,
                      isSelected: controller.isDataChecked,
                      onChanged: (value) {
                        controller.setIsDataChecked(value);
                        if (value) showDatePickerDialog(context);
                      },
                    ),
                    DefaultCheckButton(
                      title: 'Professor',
                      value: 'Option 2',
                      icon: Icons.person,
                      isSelected: controller.isProfessorChecked,
                      onChanged: (value) {
                        if (value) selectProfessor(context);
                        controller.setIsProfessorChecked(value);
                      },
                    ),
                    DefaultCheckButton(
                      title: 'Procedimento',
                      value: 'Option 3',
                      icon: Icons.medical_services_outlined,
                      isSelected: controller.isProcedimentoChecked,
                      onChanged: (value) {
                        if (value) selectProcedimento(context);
                        controller.setIsProcedimentoChecked(value);
                      },
                    ),
                  ],
                );
              }),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Fechar'),
                ),
                TextButton(
                  onPressed: () {
                    controller.setListFiltro();
                    Navigator.of(context).pop();
                  },
                  child: const Text('Filtrar'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void showDatePickerDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: const Text('Selecione uma data'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                controller.dataIn = await openCalendar(context);
                                setState(() {});
                              },
                              child: const Text('Data Inicial'),
                            ),
                            Text(controller.dataIn ?? '',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                controller.dataFi = await openCalendar(context);
                                setState(() {});
                              },
                              child: const Text('Data Final'),
                            ),
                            Text(controller.dataFi ?? '',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  controller.isDataChecked = false;
                                  Navigator.pop(context);
                                },
                                child: const Text('Cancelar')),
                            ElevatedButton(
                                onPressed: () {
                                  controller.dataInicial = controller.dataIn;
                                  controller.dataFinal = controller.dataFi;
                                  Navigator.pop(context);
                                },
                                child: const Text('Ok')),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Future<String> openCalendar(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(controller.finalDatePicker + 3),
      helpText: 'Selecione data',
    );

    if (selectedDate != null) {
      var date = DateFormat('dd/MM/yyyy').format(selectedDate);
      return date;
    }

    return '';
  }

  void selectProfessor(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: AlertDialog(
              title: const Text('Selecione um professor'),
              content: Observer(
                builder: (_) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DefaultRadioButton(
                          title: 'Professor 1',
                          value: 'Professor 1',
                          groupValue: controller.professor,
                          onChanged: (value) {
                            controller.setProfessor(value ?? '');
                            Navigator.pop(context);
                          },
                          icon: Icons.abc),
                      DefaultRadioButton(
                          title: 'Professor 2',
                          value: 'Professor 2',
                          groupValue: controller.professor,
                          onChanged: (value) {
                            controller.setProfessor(value ?? '');
                            Navigator.pop(context);
                          },
                          icon: Icons.abc),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  void selectProcedimento(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: AlertDialog(
              title: const Text('Selecione um procedimento'),
              content: Observer(
                builder: (_) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DefaultRadioButton(
                          title: 'Procedimento 1',
                          value: 'Procedimento 1',
                          groupValue: controller.procedimento,
                          onChanged: (value) {
                            controller.setProfessor(value ?? '');
                            Navigator.pop(context);
                          },
                          icon: Icons.abc),
                      DefaultRadioButton(
                          title: 'Procedimento 2',
                          value: 'Procedimento 2',
                          groupValue: controller.procedimento,
                          onChanged: (value) {
                            controller.setProfessor(value ?? '');
                            Navigator.pop(context);
                          },
                          icon: Icons.abc),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
