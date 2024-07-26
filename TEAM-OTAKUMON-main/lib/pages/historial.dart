import 'dart:html';
import 'dart:js';
// quinto intento
// https://docs.flutter.dev/development/ui/layout
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:OTAKUMON/Herramientas/downBar_ota.dart';
import 'package:OTAKUMON/Herramientas/upBar_ota.dart';


void main() => runApp(Histo_ota());

class Histo_ota extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Basic List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.perm_media),
              title: Text('Pintura en lienzo de Ojos de personaje de Anime japonés'),
            ),
            ListTile(
              leading: Icon(Icons.perm_media),
              title: Text('Retro estilo japonés Popular de Anime Jujutsu Kaisen'),
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text('Busqueda de Anime Jujutsu Kaisen '),
            ),
             ListTile(
              leading: Icon(Icons.date_range),
              title: Text('Evento de descuento'),
            ),
             ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('Agendar evento'),
            ),
             ListTile(
              leading: Icon(Icons.date_range),
              title: Text('Evento de cyber wow'),
            ),
             ListTile(
              leading: Icon(Icons.bookmark),
              title: Text('Añadido de guardado de imagen de Shingeki no Kyojin (Attack on Titan)'),
            ),
             ListTile(
              leading: Icon(Icons.image),
              title: Text('Imagenes deShingeki no Kyojin (Attack on Titan)'),
            ),
             ListTile(
              leading: Icon(Icons.search),
              title: Text('Busqueda de Shingeki no Kyojin (Attack on Titan)'),
            ),
             ListTile(
              leading: Icon(Icons.movie_filter),
              title: Text('Kimetsu no Yaiba (Demon Slayer) pelicula'),
            ),
             ListTile(
              leading: Icon(Icons.delete),
              title: Text('Eliminado de imagen de Kimetsu no Yaiba (Demon Slayer)'),
            ),
             ListTile(
              leading: Icon(Icons.image),
              title: Text('Imagenes de Kimetsu no Yaiba (Demon Slayer)'),
            ),
             ListTile(
              leading: Icon(Icons.search),
              title: Text('Busqueda de Kimetsu no Yaiba (Demon Slayer)'),
            ),
             ListTile(
              leading: Icon(Icons.bookmark),
              title: Text('Añadido a guardao imagende One Piece'),
            ),
             ListTile(
              leading: Icon(Icons.image),
              title: Text('imagenes de One Piece'),
            ),
             ListTile(
              leading: Icon(Icons.search),
              title: Text('Busqueda de One Piece'),
            ),
             ListTile(
              leading: Icon(Icons.image),
              title: Text('imagen de Jujutsu Kaisen '),
            ),
             ListTile(
              leading: Icon(Icons.bookmark),
              title: Text('Añadido a guardado Dragon Ball'),
            ),
             ListTile(
              leading: Icon(Icons.image),
              title: Text('imagen Dragon Ball'),
            ),
             ListTile(
              leading: Icon(Icons.date_range),
              title: Text('Lanzamiento de Dragon Ball Super: Super Hero'),
            ),
          ],
        ),
      ),
    );
  }
}