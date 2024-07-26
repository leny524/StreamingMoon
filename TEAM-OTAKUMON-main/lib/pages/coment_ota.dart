import 'dart:html';
import 'dart:js';
import 'package:OTAKUMON/models/publicacion.dart';
import 'package:OTAKUMON/models/publicacion_response.dart';
import 'package:OTAKUMON/providers/publicacion_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:OTAKUMON/Herramientas/downBar_ota.dart';
import 'package:OTAKUMON/Herramientas/upBar_ota.dart';
import 'package:provider/provider.dart';
import '../providers/publicacion_provider.dart';

class ComentScren extends StatefulWidget {
  @override
  createState() => _ComentScren();
}

class _ComentScren extends State<ComentScren> {
  // BARRA DE ICONOS INFERIORES
  int _selectedIndex = 4;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final publicacionProvider = Provider.of<PublicacionProvider>(context);
    final List<Publicacion> listaPublicaciones =
        publicacionProvider.listaPublicaciones;
    final txtNombre = TextEditingController();
    final txtContenido = TextEditingController();

    return Scaffold(
      appBar: upBar(),
      // PUBLICACIONES TRAIDAS DESDE LA BASE DE DATOS
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                child: Center(
                    child: Text('Añadir un comentario...',
                        style: TextStyle(
                            color: Color.fromARGB(255, 25, 77, 145),
                            fontWeight: FontWeight.bold,
                            fontSize: 30)))),

            // FORMULARIO PARA DESCRIBIR CONTENIDO
            Container(
              padding: const EdgeInsets.fromLTRB(20, 25, 20, 20),
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Color.fromRGBO(0, 0, 0, 0)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                            color: Color.fromARGB(255, 255, 255, 255),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(141, 45, 64, 88),
                                  offset: const Offset(4.0, 4.0),
                                  blurRadius: 5.0,
                                  spreadRadius: 1.0),
                              BoxShadow(
                                color: Colors.white,
                                offset: const Offset(0.0, 0.0),
                                blurRadius: 10.0,
                                spreadRadius: 2.0,
                              )
                            ]),
                        child: TextFormField(
                          autocorrect: false,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: 'Nombre del usuario',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 25, 77, 145),
                                  width: 2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          maxLines: 1,
                          controller: txtNombre,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Ingrese su nombre';
                            }
                          },
                          enableInteractiveSelection: true,
                        ),
                      ),
                      Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 0)),
                      Container(
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Color.fromRGBO(0, 0, 0, 0)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                            color: Color.fromARGB(255, 255, 255, 255),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(141, 45, 64, 88),
                                  offset: const Offset(4.0, 4.0),
                                  blurRadius: 5.0,
                                  spreadRadius: 1.0),
                              BoxShadow(
                                color: Colors.white,
                                offset: const Offset(0.0, 0.0),
                                blurRadius: 10.0,
                                spreadRadius: 2.0,
                              )
                            ]),
                        child: TextFormField(
                          autocorrect: false,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              hintText:
                                  'Espacio para que el usuario pueda escribir...',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 25, 77, 145),
                                    width: 2),
                                borderRadius: BorderRadius.circular(15),
                              )),
                          maxLines: 4,
                          controller: txtContenido,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Ingrese una descripcion para publicar';
                            }
                          },
                          enableInteractiveSelection: true,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                        child: Row(
                          children: [
                            // BOTON CANCELAR
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color.fromARGB(255, 25, 77, 145)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color.fromARGB(141, 45, 64, 88),
                                        offset: const Offset(4.0, 4.0),
                                        blurRadius: 5.0,
                                        spreadRadius: 1.0),
                                    BoxShadow(
                                      color: Colors.white,
                                      offset: const Offset(0.0, 0.0),
                                      blurRadius: 10.0,
                                      spreadRadius: 2.0,
                                    )
                                  ]),
                              child: ElevatedButton(
                                  child: const Text('Cancelar'),
                                  style: TextButton.styleFrom(
                                      primary:
                                          Color.fromARGB(255, 255, 255, 255),
                                      backgroundColor:
                                          Color.fromARGB(255, 25, 77, 145)),
                                  onPressed: () {
                                    // LINEA DE CODIGO PARA IR HACIA ATRAS
                                    Navigator.pop(context);
                                  }),
                            ),
                            // ESPACIADO PARA ALEJAR EL SIGUIENTE ELEMENTO DE FORMA HORIZONTAL LO MAS LEJOS POSIBLE
                            Spacer(),
                            // BOTON PUBLICAR
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color.fromARGB(255, 25, 77, 145)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color.fromARGB(141, 45, 64, 88),
                                        offset: const Offset(4.0, 4.0),
                                        blurRadius: 5.0,
                                        spreadRadius: 1.0),
                                    BoxShadow(
                                      color: Colors.white,
                                      offset: const Offset(0.0, 0.0),
                                      blurRadius: 10.0,
                                      spreadRadius: 2.0,
                                    )
                                  ]),
                              child: ElevatedButton(
                                  child: const Text('Publicar'),
                                  style: TextButton.styleFrom(
                                      primary:
                                          Color.fromARGB(255, 255, 255, 255),
                                      backgroundColor:
                                          Color.fromARGB(255, 25, 77, 145)),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text(
                                                  'Espere un momento...')));
                                      var publicacion = Publicacion(
                                          id: '',
                                          publicacionId: 0,
                                          descripcion: txtContenido.text,
                                          usuario123: txtNombre.text);
                                      publicacionProvider
                                          .savePublicacion(publicacion);
                                      Navigator.pushReplacementNamed(
                                          context, 'coment_ota');
                                    }
                                  }),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
            ),

            // LISTA DE COMENTARIOS
            Container(
              // ??? solo añade una altura para que funcione el API REST dentro de un "Column"...
              height: MediaQuery.of(context).size.height / 0.5,
              // ???
              child: ListView.builder(
                  itemCount: listaPublicaciones.length,
                  // ???
                  reverse: true,
                  // scrollDirection: Axis.vertical,
                  padding: const EdgeInsets.all(20),
                  // ???
                  itemBuilder: (context, index) {
                    final reversedIndex = listaPublicaciones.length - 1 - index;
                    final Publicacion = listaPublicaciones[reversedIndex];

                    return Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Color.fromRGBO(0, 0, 0, 0)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              color: Color.fromARGB(118, 176, 210, 255),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromARGB(141, 45, 64, 88),
                                    offset: const Offset(4.0, 4.0),
                                    blurRadius: 5.0,
                                    spreadRadius: 1.0),
                                BoxShadow(
                                  color: Colors.white,
                                  offset: const Offset(0.0, 0.0),
                                  blurRadius: 10.0,
                                  spreadRadius: 2.0,
                                )
                              ]),
                          child: Column(
                            children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(10, 10, 10, 10),
                                    child: Text(
                                        "Usuario: " +
                                            listaPublicaciones[index]
                                                .usuario123,
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 25, 77, 145),
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                  )),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10)),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                                    child: Text(
                                      listaPublicaciones[index].descripcion,
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 40)),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
      // BARRA DE ICONOS INFERIORES

      bottomNavigationBar: downBar(
        inx: _selectedIndex,
      ),
    );
  }
}
