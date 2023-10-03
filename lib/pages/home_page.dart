import 'package:flutter/material.dart' show BottomNavigationBar, BottomNavigationBarItem, BottomNavigationBarType, BuildContext, Colors, Curves, Icon, Icons, Key, PageController, PageView, Scaffold, State, StatefulWidget, Widget;
import 'package:flutter_aula_1/pages/carteira_page.dart';
import 'package:flutter_aula_1/pages/configuracoes_page.dart';
import 'package:flutter_aula_1/pages/favoritas_page.dart';
import 'package:flutter_aula_1/pages/moedas_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int paginaAtual = 0;
  late PageController pc;

  @override
  void initState() {    
    super.initState();
    pc = PageController(initialPage: paginaAtual);
  }

  setPaginaAtual(pagina) {
    setState(() {
      paginaAtual = pagina;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pc,
        onPageChanged: setPaginaAtual,
        children: const [
          MoedasPage(),
          FavoritasPage(),
          CarteiraPage()
,         ConfiguracoesPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: paginaAtual,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Todas'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favoritas'),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), label: 'Carteira'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Conta'),
        ],
        onTap: (pagina) {
          pc.animateToPage(
            pagina, 
            duration: const Duration(milliseconds: 400), 
            curve: Curves.ease,
          );
        },
        backgroundColor: Colors.grey[100],
      ),
    );
  }
}