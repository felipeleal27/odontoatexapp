import 'package:bitebyte/app/modules/views/consultas_cliente/controller/consultas_cliente_controller.dart';
import 'package:bitebyte/app/modules/views/home/controller/home_controller.dart';
import 'package:bitebyte/app/modules/views/home/widgets/card_consultas.dart';
import 'package:bitebyte/app/modules/views/home/widgets/filtrar_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
              const FiltrarTile(),
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
                            onTapDown: (details) {},
                            onLongPress: () => controller.setShowSelect(),
                            child: Observer(
                              builder: (_) {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.center, // Add this
                                  children: [
                                    const Flexible(
                                      child: Align(
                                        alignment: Alignment.center, // And this
                                        child: CardConsultas(),
                                      ),
                                    ),
                                    controller.showSelecteds
                                        ? SizedBox(
                                            width: size.width / 10,
                                            child: Checkbox(
                                                value:
                                                    controller.selecteds[index],
                                                onChanged: (value) {
                                                  controller.setSelectedIndex(
                                                      value, index);
                                                }),
                                          )
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
}
