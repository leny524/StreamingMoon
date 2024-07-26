import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/producto.dart';
import '../providers/producto_provider.dart';

class ProductoFormScreen extends StatefulWidget {
  const ProductoFormScreen({Key? key}) : super(key: key);

  @override
  State<ProductoFormScreen> createState() => _ProductoFormScreen();
}

enum Genero { hombre, mujer }

class _ProductoFormScreen extends State<ProductoFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final txtProductoId = TextEditingController();
  final txtDescripcion = TextEditingController();
  final txtPrecio = TextEditingController();
  final txtImagen = TextEditingController();
  bool? _estadoActivado = false;
  Genero? _catSeleccion = Genero.hombre;
  bool formModificado = false;

  @override
  Widget build(BuildContext context) {
    final productoProvider = Provider.of<ProductoProvider>(context);
    final Producto? producto =
        ModalRoute.of(context)!.settings.arguments as Producto?;

    if (!formModificado) {
      if (producto != null) {
        txtProductoId.text = producto.productoId.toString();
        txtDescripcion.text = producto.descripcion.toString();
        txtPrecio.text = producto.precio.toString();
        txtImagen.text = producto.imagen;
        print(producto.genero);
        print(producto.estado);
        if (producto.genero == 'Genero.hombre') {
          _catSeleccion = Genero.hombre;
        } else {
          _catSeleccion = Genero.mujer;
        }

        _estadoActivado = (producto.estado == 'true') ? true : false;
      } else {
        txtProductoId.text = '0';
        txtDescripcion.text = '';
        txtPrecio.text = '';
        txtImagen.text = '';
      }
    }
    return Scaffold(
      backgroundColor: Colors.brown[200],
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.keyboard_arrow_left_rounded), onPressed: (){Navigator.pushNamed(context, 'Config_ota');}),
        title: Text('REGISTRO DE ACCESORIOS'),
        backgroundColor: Colors.brown[800],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Image(
                width: 120,
                height: 120,
                image: AssetImage("../assets/loi.png"),
                fit: BoxFit.contain,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                readOnly: true,
                controller: txtProductoId,
                decoration: InputDecoration(
                    labelText: 'ProductoId',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
              SizedBox(
                height: 20,
              ),

              SizedBox(height: 20),
              TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    labelText: 'Producto',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                controller: txtDescripcion,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Ingrese un producto';
                  }
                },
              ),

              SizedBox(height: 20),
              TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Precio',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                controller: txtPrecio,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Ingrese el precio';
                  }
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Imagen',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                controller: txtImagen,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Ingrese un imagen de su producto';
                  }
                },
              ),
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Text('Categoría'),
                  SizedBox(
                    width: 20,
                  ),
                  Radio(
                      value: Genero.hombre,
                      groupValue: _catSeleccion,
                      onChanged: (value) {
                        setState(() {
                          _catSeleccion = value as Genero?;
                          print(_catSeleccion);
                          formModificado = true;
                        });
                      }),
                  Text('Hombre'),
                  SizedBox(
                    width: 20,
                  ),
                  Radio(
                      value: Genero.mujer,
                      groupValue: _catSeleccion,
                      onChanged: (value) {
                        setState(() {
                          _catSeleccion = value as Genero?;
                          print(_catSeleccion);
                          formModificado = true;
                        });
                      }),
                  Text('Mujer'),
                ],
              ),

              SizedBox(
                height: 20,
              ),

              // CHECKBOX
              Row(
                children: <Widget>[
                  Text('Estado'),
                  SizedBox(
                    width: 20,
                  ),
                  Checkbox(
                    value: _estadoActivado,
                    onChanged: (value) {
                      setState(() {
                        _estadoActivado = value;
                        print(_estadoActivado);
                        formModificado = true;
                      });
                    },
                  ),
                  Text('Activo'),
                ],
              ),
              Container(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromRGBO(93, 64, 55, 1)),
                  ),
                  child: const Text('GUARDAR'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Validando...')));
                      var producto = Producto(
                          id: '',
                          productoId: int.parse(txtProductoId.text),
                          descripcion: txtDescripcion.text,
                          precio: double.parse(txtPrecio.text),
                          imagen: txtImagen.text,
                          genero: _catSeleccion.toString(),
                          estado: _estadoActivado.toString()
                          );
                      productoProvider.saveProducto(producto);

                      Navigator.pushReplacementNamed(
                          context, 'ruta_productos');
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}