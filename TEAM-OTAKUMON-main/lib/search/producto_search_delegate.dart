import 'package:flutter/material.dart';

import '../models/producto.dart';

class ProductoSearchDelegate extends SearchDelegate<Producto> {
  final List<Producto> listaProducto;

  ProductoSearchDelegate(this.listaProducto);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear, color: Colors.blueAccent),
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
              Producto(
                  id: '',
                  productoId: 0,
                  descripcion: '',
                  precio: 0,
                  imagen: '',
                  genero: '',
                  estado: ''));
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final listaFiltrada = query.isEmpty
        ? listaProducto
        : listaProducto
            .where((producto) => producto.descripcion
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
        itemCount: listaFiltrada.length,
        itemBuilder: (BuildContext context, int index) {
          return _cardProducto(listaFiltrada[index], context);
        });
  }

  Widget _cardProducto(Producto productoFiltrado, context) {
    return Card(
      child: Column(children: <Widget>[
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(productoFiltrado.imagen),
          ),
          title: Text(productoFiltrado.descripcion),
          subtitle: Text('S/. ${productoFiltrado.precio}'),
          trailing: const Icon(Icons.arrow_right_alt_sharp),
          onTap: () {
            Navigator.pushNamed(context, 'ruta_producto_form',
                arguments: productoFiltrado);
          },
        )
      ]),
    );
  }
}