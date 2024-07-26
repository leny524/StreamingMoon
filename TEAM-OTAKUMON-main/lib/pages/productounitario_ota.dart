import 'package:OTAKUMON/models/inicioproducto.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/inicioproducto_provider.dart';

class ProductoUnitarioScreen extends StatefulWidget {
  const ProductoUnitarioScreen({Key? key}) : super(key: key);

  @override
  State<ProductoUnitarioScreen> createState() => _ProductoUnitarioScreenState();
}

class _ProductoUnitarioScreenState extends State<ProductoUnitarioScreen> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final inicioproductoProvider = Provider.of<InicioproductoProvider>(context);
    final Inicioproducto? inicioproducto =
        ModalRoute.of(context)!.settings.arguments as Inicioproducto?;
    print(inicioproducto!.titulo);
    return Scaffold(
      body: Container(
          child: Column(
        children: [
          Text(
            inicioproducto.titulo,
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          Image(image: NetworkImage(inicioproducto.imagen)),
          Text(inicioproducto.descripcion),
          Text(inicioproducto.precio.toString()),
        ],
      )),
    );
  }
}

// ProductoUnitarioScreen()