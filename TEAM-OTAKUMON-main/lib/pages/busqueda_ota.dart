import 'dart:html';
import 'dart:js';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:OTAKUMON/Herramientas/upBar_ota.dart';
import '../Herramientas/downBar_ota.dart';

class busqueda_pag extends StatefulWidget {
  @override
  createState() => _busqueda_pag();
}

class _busqueda_pag extends State<busqueda_pag> {
  // --- RUTAS ---
  // PARA RUTAS (COPIAR Y PEGAR ANTES DE "@override" DESDE AQUI ...
  // en _selectedIndex coloca un numero entero (del 0 al 3) para seleccionar el icono
  int _selectedIndex = 2;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // ... HASTA AQUI)
// --- RUTAS ---

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: upBar(),
      body: Center(
        child: Text('poner boton de busqueda'),
      ),
      // --- RUTAS ---
      // AQUI ESTA LA BARRA DE ICONOS INFERIORES (copiar y pegar desde aqui...
      bottomNavigationBar: downBar(inx: _selectedIndex,),
      // HASTA AQUI ...
// --- RUTAS ---
    );
  }
}