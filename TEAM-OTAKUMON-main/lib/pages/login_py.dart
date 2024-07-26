import 'package:flutter/material.dart';
import "package:flutter/src/material/colors.dart";
import 'package:flutter/widgets.dart';

class LoginPy extends StatefulWidget {
  @override
  createState() => _LoginPy();
}

class _LoginPy extends State<LoginPy> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final txtEmail = TextEditingController();
    final txtPass = TextEditingController();
    return Scaffold(
      body: Stack(
        key: _formKey,
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 50.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 53, 133, 238),
                  Color.fromARGB(255, 25, 77, 145),
                ],
              ),
            ),
            //Imagen otakumon
            child: Image.asset(
              "../assets/loi.png",
              /* ,color: Colors.white */
              height: 190,
            ),
          ),
          Transform.translate(
            offset: Offset(0, 20),
            child: Form(
              key: _formKey,
              child: Center(
                // children: <Widget>[]

                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 130),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 35, vertical: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      key: _formKey,
                      children: <Widget>[
                        //Gmail.com
                        TextFormField(
                          autocorrect: false,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              hintText: 'example@otakumon.com',
                              labelText: "Gmail "),
                          // controller: txtEmail,
                          onSaved: (value) {
                            txtEmail == value;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Por favor ingresa tu gmail';
                            }
                          },
                        ),
                        SizedBox(height: 30),
                        //Password

                        TextFormField(
                          key: _formKey,
                          autocorrect: false,
                          keyboardType: TextInputType.emailAddress,
                          decoration:
                              InputDecoration(labelText: "Contraseña: "),
                          controller: txtPass,
                          obscureText: true,
                          validator: (value) {
                            // La contraseña debe tener 3 caracteres
                            if (value!.length < 6) {
                              return 'La contraseña debe tener mínimo 6 caracteres';
                            } else {
                              return null;
                            }
                          },
                        ),

                        SizedBox(height: 30),
                        //boton ingresar
                        SizedBox(
                          //forma de boton
                          width: double.infinity,
                          height: 50.0,
                          child: ElevatedButton(
                            key: _formKey,
                            child: const Text(
                              'Ingresar',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                            //Presionar boton ingresar
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Validando...')));
                                // SIMULANDO EL ENVIO DE LAS CREDENCIALES
                                if (txtEmail.text == 'admin@otakumon.com' &&
                                    txtPass.text == '123456') {
                                  // NAVEGANDO A LA RUTA PRINCIPAL
                                  Navigator.pushReplacementNamed(
                                      context, 'inicio_ota');
                                } else {
                                  // CREDENCIALES INCORRECTAS
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'Credenciales incorrectas...')));
                                }
                              }
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('No tienes un usuario'),
                            FlatButton(
                              child: const Text(
                                'Registrarse',
                                style: TextStyle(color: Colors.blue),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, 'registro_screens');
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            FlatButton(
                              child: const Text(
                                'Continuar sin usuario',
                                // icon: Icon(Icons.lock_outline),
                                style: TextStyle(color: Colors.blue),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, 'inicio2_ota');
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
