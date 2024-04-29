import 'package:bitebyte/app/core/ui/widgtes/default_text_form_field.dart';
import 'package:bitebyte/app/modules/views/home/controller/home_controller.dart';
import 'package:bitebyte/app/modules/views/home/widgets/card_consultas.dart';
import 'package:bitebyte/app/modules/views/login_page/login_nome_rotas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                  child: DefaultTextFormField(
                    labelText: 'Pesquisar',
                    hintText: 'Pesquisar...',
                    prefixIconData: Icons.search,
                    // controller: TextEditingController(text: controller.search),
                    suffixIconButton: controller.search.isNotEmpty
                        ? IconButton(
                            onPressed: () {
                              controller.searchClear();
                            },
                            icon: const Icon(Icons.clear))
                        : null,
                    onChanged: (value) => controller.setSearch(value),
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
      preferredSize: Size.fromHeight(size.height * .2),
      child: AppBar(
        toolbarHeight: size.height,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(50),
          ),
        ),
        title: Column(
          children: [
            Container(
              height: size.height * .12,
              width: size.width * .25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                image: const DecorationImage(
                  image: AssetImage('assets/imagens/logoapp.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: size.height.h / 50),
            const Text('CONSULTAS'),
          ],
        ),
        centerTitle: true,
      ),
    );
  }

  Drawer buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(),
            child: Text(
              'Menu',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Página Inicial'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Configurações'),
            onTap: () {},
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
}
