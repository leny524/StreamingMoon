import 'package:OTAKUMON/pages/registro_screens.dart';
import 'package:flutter/material.dart';
import 'package:OTAKUMON/models/inicioproducto.dart';

import '../Herramientas/downBar_ota.dart';
import '../Herramientas/upBar_ota.dart';

/*
class BusquedaScreen extends StatefulWidget {
  @override
  createState() => _BusquedaScreen();
}

class _BusquedaScreen extends State<BusquedaScreen> {
  int _selectedIndex = 2;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: upBar(),
      body: Container(),
      bottomNavigationBar: downBar(
        inx: _selectedIndex,
      ),
    );
  }
}
*/
class InicioProductoSearchDelegate extends SearchDelegate<Inicioproducto> {
  final List<Inicioproducto> listaInicioproductos;

  InicioProductoSearchDelegate(this.listaInicioproductos);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          icon: const Icon(Icons.backspace, color: Colors.blueAccent),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.blueAccent),
        onPressed: () {
          close(
              context,
              Inicioproducto(
                  id: '',
                  inicioproductoId: 0,
                  titulo: '',
                  descripcion: '',
                  precio: 0,
                  imagen: ''));
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final listaFiltrada = query.isEmpty
        ? listaInicioproductos
        : listaInicioproductos
            .where((inicioproducto) => inicioproducto.titulo
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
        itemCount: listaFiltrada.length,
        itemBuilder: (BuildContext context, int index) {
          return _listInicioproducto(listaFiltrada[index], context);
        });
  }

  Widget _listInicioproducto(Inicioproducto productoFiltrado, context) {
    return Card(
        child: Column(
      children: <Widget>[
        GestureDetector(
          child: Container(
            child: Column(
              children: <Widget>[
                Divider(),
                SizedBox(
                  height: 20,
                ),
                Text(
                  productoFiltrado.titulo,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 25, 77, 145)),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(
                      image: NetworkImage(productoFiltrado.imagen),
                      height: 225,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              productoFiltrado.descripcion,
                              textAlign: TextAlign.justify,
                              style: TextStyle(fontSize: 13),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "S/. " + productoFiltrado.precio.toString(),
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 25, 77, 145)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          onTap: () {
            Navigator.pushNamed(context, "productounitario_ota",//  SE TIENE QUE CAMBIAR POR LA PANTALLA DE CUANDO SE ABRE UNA IMAGEN
                arguments: productoFiltrado);
          },
        )
        /*
        ListTile(
          leading: CircleAvatar(
              backgroundImage: NetworkImage(productoFiltrado.imagen)),
          title: Text(productoFiltrado.titulo),
        ),*/
      ],
    ));
  }
}
