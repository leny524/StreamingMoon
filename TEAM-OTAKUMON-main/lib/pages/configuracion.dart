import 'package:flutter/material.dart';

class BibliConfig extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 37, 90, 158),
        leading: IconButton(icon: Icon(Icons.keyboard_arrow_left_rounded), onPressed: (){Navigator.pushNamed(context, 'biblioteca_ota');},),
        title: Text('Configuracion'),
      ),
      body: ListView(
        children: <Widget>[
          _crearItem(context, Icons.card_membership_rounded, 'Tarjeta de Credito', 'Credic_Card'),
          Divider(),
          _crearItem(context, Icons.help_outline_sharp, 'Ayuda', 'Ayuda_ota'),
          Divider(),
          _crearItem(context, Icons.info_outline_rounded, 'informacion', 'Inf_ota'),
          Divider(),
          _crearItem(context, Icons.segment_rounded, 'Sugerencias', 'Sug_ota'),
          Divider(),
          _crearItem(context, Icons.format_align_center_sharp, 'Encuestas', 'ruta_producto_form'),
          Divider(),
          _crearItem(context, Icons.format_indent_increase, 'Reportes', 'ruta_producto'),
          Divider(),
        ],
      ),
    );
  }

  Widget _crearItem(BuildContext context, IconData icon, String nombre, String ruta) {

    return ListTile(
            onTap: () {
              Navigator.pushNamed(context, ruta);
            },
            leading: Icon(icon),
            title: Text(nombre),
            trailing: Icon(Icons.keyboard_arrow_right),
          );
  }
}