import 'package:bitebyte/app/modules/views/home/controller/home_controller.dart';
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
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        title: Observer(
          builder: (_) => controller.selectedIndex == 0
              ? const Text('CONSULTAS')
              : const Text('PERFIL'),
        ),
        centerTitle: true,
        actions: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              // color: Colors.white,
              image: const DecorationImage(
                image: AssetImage(
                  'assets/imagens/logobite.png',
                ),
              ),
            ),
            margin: const EdgeInsets.only(right: 10),
          ),
        ],
      ),
      drawer: Observer(builder: (_) => buildDrawer(context)),
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          controller.onTabTapped(index);
        },
        children: controller.widgetOptions,
      ),
      // bottomNavigationBar: Observer(
      //   builder: (context) {
      //     return BottomNavigationBar(
      //       onTap: (value) {
      //         pageController.animateToPage(
      //           value,
      //           duration: const Duration(milliseconds: 550),
      //           curve: Curves.easeInOut,
      //         );
      //       },
      //       currentIndex: controller.selectedIndex,
      //       items: const [
      //         BottomNavigationBarItem(
      //           icon: Icon(Icons.home),
      //           label: 'Consultas',
      //         ),
      //         // BottomNavigationBarItem(
      //         //   icon: Icon(Icons.date_range),
      //         //   label: 'Agendar',
      //         // ),
      //         BottomNavigationBarItem(
      //           icon: Icon(Icons.person),
      //           label: 'Perfil',
      //         )
      //       ],
      //     );
      //   },
      // ),
    );
  }

  Widget buildDrawer(BuildContext context) {
    return Observer(
      builder: (_) {
        return Drawer(
          child: Column(
            children: <Widget>[
              Expanded(
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
                      leading: const Icon(Icons.logout),
                      title: const Text('Sair'),
                      onTap: () {
                        controller.clearLocalStorage();
                        Modular.to.navigate(
                            '${LoginNomeRotas.modulo}${LoginNomeRotas.login}');
                      },
                    ),
                    // ListTile(
                    //   leading: const Icon(Icons.home),
                    //   title: const Text('Início'),
                    //   onTap: () {},
                    // ),
                    // ListTile(
                    //   leading: const Icon(Icons.person),
                    //   title: const Text('Perfil'),
                    //   onTap: () {},
                    // ),
                    // ListTile(
                    //   leading: const Icon(Icons.calendar_today),
                    //   title: const Text('Agenda'),
                    //   onTap: () {},
                    // ),
                    // ListTile(
                    //   leading: const Icon(Icons.notifications),
                    //   title: const Text('Notificações'),
                    //   onTap: () {},
                    // ),
                    // ListTile(
                    //   leading: const Icon(Icons.settings),
                    //   title: const Text('Configurações'),
                    //   onTap: () {},
                    // ),
                  ],
                ),
              ),
              // This ListTile is outside the Expanded widget and will be pushed down
              // ListTile(
              //   leading: const Icon(Icons.logout),
              //   title: const Text('Sair'),
              //   onTap: () {
              //     controller.clearLocalStorage();
              //     Modular.to.navigate(
              //         '${LoginNomeRotas.modulo}${LoginNomeRotas.login}');
              //   },
              // ),
            ],
          ),
        );
      },
    );
  }
}
