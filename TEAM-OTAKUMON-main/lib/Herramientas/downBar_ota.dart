import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../models/inicioproducto.dart';
import '../providers/inicioproducto_provider.dart';
import '../search/inicioproducto_search_delegate.dart';

class downBar extends StatelessWidget {
  final int inx;

  downBar({
    required this.inx,
  });

  @override
  Widget build(BuildContext context) {
    final inicioproductoProvider = Provider.of<InicioproductoProvider>(context);
    final List<Inicioproducto> listaInicioproducto =
        inicioproductoProvider.listaInicioproductos;

    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
        BottomNavigationBarItem(icon: Icon(Icons.add_box), label: 'Agregar'),
        BottomNavigationBarItem(
            icon: Icon(Icons.search_sharp), label: 'Buscar'),
        BottomNavigationBarItem(
            icon: Icon(Icons.cases_rounded), label: 'Biblioteca'),
        BottomNavigationBarItem(
            icon: Icon(Icons.comment), label: 'comentarios'),
      ],

      // SELECCIONA LA PANTALLA ACTUAL
      currentIndex: this.inx,
      // MUESTRA EL TEXTO DE LAS OPCIONES TANTO NO SELECCIONADAS COMO SELECCIONADAS
      showUnselectedLabels: true,
      showSelectedLabels: true,

      // OPCIONES NO SELECCIONADAS
      unselectedItemColor: Color.fromARGB(127, 0, 0, 0),

      // OPCION SELECCIONADA
      selectedItemColor: Color.fromARGB(255, 25, 77, 145),

      selectedLabelStyle: TextStyle(fontSize: 12),

      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushNamed(context, "inicio2_ota");
            break;
          case 1:
            Navigator.pushNamed(context, "agregar_ota");
            break;
          case 2:
            showSearch(
                context: context,
                delegate: InicioProductoSearchDelegate(listaInicioproducto));
            ;
            break;
          // FALTA PANTALLA
          case 3:
            Navigator.pushNamed(context, "biblioteca_ota");
            break;
          // FALTA PANTALLA
          case 4:
            Navigator.pushNamed(context, "comment_ota");
        }
      },
    );

//color azul de la app 255, 60, 41, 181
//color negro transparente 127, 0, 0, 0
  }
}
