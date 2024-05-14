import 'package:bitebyte/app/core/ui/widgtes/default_check_button.dart';
import 'package:bitebyte/app/core/ui/widgtes/default_radio_button.dart';
import 'package:bitebyte/app/modules/views/consultas_cliente/controller/consultas_cliente_controller.dart';
import 'package:bitebyte/app/modules/views/home/controller/home_controller.dart';
import 'package:bitebyte/app/modules/views/home/widgets/card_consultas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

class HomeConsultasPage extends StatefulWidget {
  const HomeConsultasPage({super.key});

  @override
  State<HomeConsultasPage> createState() => _HomeConsultasPageState();
}

class _HomeConsultasPageState extends State<HomeConsultasPage> {
  final controller = Modular.get<HomeController>();
  final controllerConsultas = Modular.get<ConsultasController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Observer(
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: size.height / 80),
              Observer(
                builder: (_) {
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
                        child: ListTile(
                          leading: const Icon(Icons.filter_alt_outlined),
                          title: Text(
                            controller.listFiltro.isEmpty
                                ? 'Filtrar'
                                : 'Filtros:',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: controller.listFiltro.isNotEmpty
                              ? Column(
                                  children:
                                      controller.listFiltro.map((element) {
                                    return Row(
                                      children: [
                                        Text(element),
                                        element == "Data"
                                            ? Text(
                                                ' - ${controller.dataInicial} - ${controller.dataFinal}')
                                            : element == "Professor"
                                                ? Text(
                                                    ' - ${controller.professor}')
                                                : Text(
                                                    ' - ${controller.procedimento}'),
                                      ],
                                    );
                                  }).toList(),
                                )
                              : null,
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
                },
              ),
              SizedBox(height: size.height / 80),
              Observer(
                builder: (_) {
                  return Row(
                    mainAxisAlignment: controller.showSelecteds
                        ? MainAxisAlignment.spaceBetween
                        : MainAxisAlignment.center,
                    children: [
                      controller.showSelecteds
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Checkbox(
                                    value: controller.isSelectedAll,
                                    onChanged: (value) {
                                      controller.isSelectedAll = value!;

                                      controller.selecionaTodos(
                                          controller.isSelectedAll);
                                    }),
                                const Text('Selecionar todos'),
                                // !controller.showSelecteds
                                //     ? const ElevatedButton(
                                //         onPressed: null, child: Text(''))
                                //     : Container(),
                              ],
                            )
                          : Container(),
                      AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        child: ElevatedButton(
                          onPressed: () => controller.setShowSelect(),
                          child: !controller.showSelecteds
                              ? const Text('SELECIONAR')
                              : const Text('OK'),
                        ),
                      ),
                    ],
                  );
                },
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 30, left: 5, right: 5),
                          child: GestureDetector(
                            onLongPress: () => controller.setShowSelect(),
                            child: Observer(
                              builder: (_) {
                                return Row(
                                  children: [
                                    const Flexible(child: CardConsultas()),
                                    controller.showSelecteds
                                        ? Checkbox(
                                            value: controller.selecteds[index],
                                            onChanged: (value) {
                                              controller.setSelectedIndex(
                                                  value, index);
                                            })
                                        : Container(),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
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
                        if (value) {
                          selectProfessor(context);
                        }
                        controller.setIsProfessorChecked(value);
                      },
                    ),
                    DefaultCheckButton(
                      title: 'Procedimento',
                      value: 'Option 3',
                      icon: Icons.medical_services_outlined,
                      isSelected: controller.isProcedimentoChecked,
                      onChanged: (value) {
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
        return AlertDialog(
          title: const Text('Selecione uma data'),
          content: Observer(
            builder: (_) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          controller.dataInicial = await openCalendar(context);
                          setState(() {});
                        },
                        child: const Text('Botão 1'),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          controller.dataFinal = await openCalendar(context);
                          setState(() {});
                        },
                        child: const Text('Botão 2'),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(controller.dataInicial),
                      Text(controller.dataFinal)
                    ],
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  Future<String> openCalendar(BuildContext context) async {
    await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      helpText: 'Selecione data',
    ).then((selectedDate) {
      var date = DateFormat('dd/MM/yyyy').format(selectedDate!);
      print(date);
      return date;
    });
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
                    mainAxisSize: MainAxisSize
                        .min, // Adicionado para reduzir o tamanho da coluna ao mínimo
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
                      // Adicione mais botões de opção conforme necessário
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
