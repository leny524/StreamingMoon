import 'dart:html';
import 'dart:js';
import 'package:OTAKUMON/models/inicioproducto.dart';
import 'package:OTAKUMON/models/inicioproducto_response.dart';
import 'package:OTAKUMON/providers/inicioproducto_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:OTAKUMON/Herramientas/downBar_ota.dart';
import 'package:OTAKUMON/Herramientas/upBar_ota.dart';
import 'package:provider/provider.dart';
import '../Herramientas/downBar_ota.dart';

class ModificarContenidoScreen extends StatefulWidget {
  const ModificarContenidoScreen({Key? key}) : super(key: key);

  @override
  State<ModificarContenidoScreen> createState() => _ModificarContenidoScreen();
}

class _ModificarContenidoScreen extends State<ModificarContenidoScreen> {
  int _selectedIndex = 1;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final _formKey = GlobalKey<FormState>();
  final txtInicioproductoId = TextEditingController();
  final txtTitulo = TextEditingController();
  final txtDescripcion = TextEditingController();
  final txtImagenURL = TextEditingController();
  final txtPrecio = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final inicioproductoProvider = Provider.of<InicioproductoProvider>(context);
    // final List<Inicioproducto> listaInicioproducto = inicioproductoProvider.listaInicioproductos;
    // RECIBIR EL PRODUCTO POR ARGUMENTOS
    final Inicioproducto? inicioproducto =
        ModalRoute.of(context)!.settings.arguments as Inicioproducto?;
    print(inicioproducto!.titulo);

    if (inicioproducto != null) {
      // EDITAR
      txtInicioproductoId.text = inicioproducto.inicioproductoId.toString();
      txtTitulo.text = inicioproducto.titulo.toString();
      txtDescripcion.text = inicioproducto.descripcion.toString();
      txtImagenURL.text = inicioproducto.imagen;
      txtPrecio.text = inicioproducto.precio.toString();
    } else {
      // NUEVO
      txtInicioproductoId.text = '0';
      txtTitulo.text = '';
      txtDescripcion.text = '';
      txtImagenURL.text = '';
      txtPrecio.text = '';
    }

    return Scaffold(
      appBar: upBar(),
      // PUBLICACIONES TRAIDAS DESDE LA BASE DE DATOS
      body: SingleChildScrollView(
        child: Column(
          children: [
            // TITULO DE LA PANTALLA
            Container(
                padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                child: Center(
                    child: Text('Modificar el producto seleccionado...',
                        style: TextStyle(
                            color: Color.fromARGB(255, 25, 77, 145),
                            fontWeight: FontWeight.bold,
                            fontSize: 30)))),
            // FORMULARIO
            Container(
              padding: const EdgeInsets.fromLTRB(20, 25, 20, 20),
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      // CAMPO DE TEXTO
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
                              hintText: 'Titulo',
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
                            controller: txtTitulo,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Ingrese el titulo';
                              }
                            },
                            enableInteractiveSelection: true,
                          )),
                      Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 0)),
                      // CAMPO DE TEXTO
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
                              hintText: 'Descripción',
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
                            maxLines: 8,
                            controller: txtDescripcion,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Ingrese una descripción';
                              }
                            },
                            enableInteractiveSelection: true,
                          )),
                      Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 0)),
                      // CAMPO DE TEXTO
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
                              hintText: 'Dirección URL de la imagen',
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
                            controller: txtImagenURL,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Ingrese una dirección URL';
                              }
                            },
                            enableInteractiveSelection: true,
                          )),
                      Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 0)),
                      // CAMPO DE TEXTO
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
                              hintText: 'Precio',
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
                            controller: txtPrecio,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Ingrese el precio';
                              }
                            },
                            enableInteractiveSelection: true,
                          )),
                      // BOTONES ACEPTAR Y CANCELAR
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
                                  child: const Text('Aplicar nuevos cambios'),
                                  style: TextButton.styleFrom(
                                      primary:
                                          Color.fromARGB(255, 255, 255, 255),
                                      backgroundColor:
                                          Color.fromARGB(255, 25, 77, 145)),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content:
                                                  Text('Espere un momento')));
                                      var inicioproducto = Inicioproducto(
                                        id: '',
                                        inicioproductoId:
                                            int.parse(txtInicioproductoId.text),
                                        titulo: txtTitulo.text,
                                        descripcion: txtDescripcion.text,
                                        precio: int.parse(txtPrecio.text),
                                        imagen: txtImagenURL.text,
                                      );
                                      inicioproductoProvider
                                          .saveInicioproducto(inicioproducto);
                                      Navigator.pushReplacementNamed(
                                          context, 'inicio2_ota');
                                    }
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
