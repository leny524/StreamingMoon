import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/producto.dart';
import '../providers/producto_provider.dart';
import '../search/producto_search_delegate.dart';

class ProductoScreen extends StatefulWidget {
  const ProductoScreen({Key? key}) : super(key: key);

  @override
  State<ProductoScreen> createState() => _ProductoScreenState();
}

class _ProductoScreenState extends State<ProductoScreen> {
  @override
  Widget build(BuildContext context) {
    final productoProvider = Provider.of<ProductoProvider>(context);
    final List<Producto> listaProducto = productoProvider.listaProductos;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.brown[200],
      appBar: AppBar(
        backgroundColor: Colors.brown[800],
        title: Text('Productos'),
        elevation: 0,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: ProductoSearchDelegate(listaProducto));
              })
        ],
      ),
      /*drawer: const MenuLateral(),
      body: Container(
        width: double.infinity,
        height: size.height * 0.7,
        color: Colors.brown[200],
        child: Swiper(
          itemCount: listaProducto.length,
          layout: SwiperLayout.STACK,
          itemWidth: size.width * 0.8,
          itemHeight: size.height * 1,
          itemBuilder: (BuildContext context, int index) {
            return _cardProducto(listaProducto[index]);
          },
        ),
      ),*/
      floatingActionButton: FloatingActionButton(
        foregroundColor: Color.fromARGB(255, 0, 0, 0),
        backgroundColor: Colors.brown,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, 'ruta_producto_form');
        },
      ),
    );
  }
}

class _cardProducto extends StatelessWidget {
  final Producto producto;
  _cardProducto(this.producto);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 140, bottom: 20),
      width: double.infinity,
      height: size.height * 0.5,
      decoration: _cardBorders(),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [_ImagenFondo(producto), _EtiquetaPrecio(producto)],
      ),
    );
  }
}

class _ImagenFondo extends StatelessWidget {
  final Producto producto;

  _ImagenFondo(this.producto);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: double.infinity,
        height: 400,
        child: FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage(producto.imagen),
            fit: BoxFit.cover),
      ),
    );
  }
}

class _EtiquetaPrecio extends StatelessWidget {
  final Producto producto;
  _EtiquetaPrecio(this.producto);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25)),
          color: Color.fromRGBO(109, 76, 65, 1)),
      child: ListTile(
        title: Text(
          producto.descripcion,
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 0, 0)),
        ),
        subtitle: Text(
          'S/.' + producto.precio.toString(),
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 11, 11, 11)),
        ),
        trailing: IconButton(
          icon: const Icon(
            Icons.edit,
            color: Color.fromARGB(255, 183, 28, 66),
          ),
          onPressed: () {
            Navigator.pushNamed(context, 'ruta_producto_form',
                arguments: producto);
          },
        ),
      ),
    );
  }
}

BoxDecoration _cardBorders() => BoxDecoration(
        color: Colors.brown[100],
        borderRadius: BorderRadius.circular(25),
        boxShadow: const [
          BoxShadow(
              color: Color.fromRGBO(62, 39, 35, 1),
              offset: Offset(0, 15),
              blurRadius: 20)
        ]);