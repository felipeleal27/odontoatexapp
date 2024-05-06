import 'package:bitebyte/app/core/ui/widgtes/default_redio_button.dart';
import 'package:bitebyte/app/modules/views/home/controller/home_controller.dart';
import 'package:bitebyte/app/modules/views/home/widgets/card_consultas.dart';
import 'package:bitebyte/app/modules/views/login_page/login_nome_rotas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(size),
      drawer: buildDrawer(context),
      body: Padding(
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
                            ? Text(controller.listFiltro.join(' - '))
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
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 30, left: 5, right: 5),
                        child: CardConsultas(),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

//APPBAR
  PreferredSize appBar(Size size) {
    return PreferredSize(
      // preferredSize: Size.fromHeight(size.height * .2),
      preferredSize: Size.fromHeight(size.height * .1),
      child: AppBar(
        toolbarHeight: size.height,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        title: const Text('CONSULTAS'),
        centerTitle: true,
      ),
    );
  }

  Drawer buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/imagens/logoapp.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'FELIPE LEAL',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Início'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Perfil'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.calendar_today),
            title: const Text('Agenda'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notificações'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Configurações'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.filter_alt_outlined),
            title: const Text('Filtrar'),
            onTap: () {
              Modular.to.pop();
              filtrar(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Sair'),
            onTap: () {
              controller.clearLocalStorage();
              Modular.to
                  .navigate('${LoginNomeRotas.modulo}${LoginNomeRotas.login}');
            },
          ),
        ],
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
                        showDatePickerDialog(context);
                      },
                    ),
                    DefaultCheckButton(
                      title: 'Professor',
                      value: 'Option 2',
                      icon: Icons.person,
                      isSelected: controller.isProfessorChecked,
                      onChanged: (value) {
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
                        onPressed: () {
                          controller.selectedDate1 = openCalendar(context);
                        },
                        child: const Text('Botão 1'),
                      ),
                      Text('Data Selecionada: ${controller.selectedDate1}'),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // TODO: Implementar ação para o segundo botão
                    },
                    child: const Text('Botão 2'),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  String openCalendar(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      helpText: 'Selecione',
    ).then((selectedDate) {
      return selectedDate;
    });
    return '';
  }
}
