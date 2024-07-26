import 'package:flutter/material.dart';
import "package:flutter/src/material/colors.dart";
import 'package:provider/provider.dart';

class PagoScreen extends StatefulWidget {
  const PagoScreen({Key? key}) : super(key: key);

  _PagoScreen createState() => _PagoScreen();
}

class _PagoScreen extends State<PagoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 90.0, horizontal: 50.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 53, 133, 238),
                  Color.fromARGB(255, 25, 77, 145),
                ],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FlatButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, 'Config_ota');
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    label: Text('Back', style: TextStyle(color: Colors.white))),
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 150.0),
              child: Image.asset("../assets/loi.png", height: 175)),
          Transform.translate(
            offset: Offset(0, 100),
            child: Center(
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                margin: const EdgeInsets.only(
                    left: 50, right: 50, top: 0, bottom: 20),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                  child: Form(
                  
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(height: 20),
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: "Numero de tarjeta "),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          decoration: InputDecoration(labelText: "CVC "),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Fecha de caducidad',
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          decoration: InputDecoration(labelText: "Contraseña"),
                          obscureText: true,
                          validator: (value) {},
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: "Titular de Tarjeta"),
                          obscureText: true,
                          validator: (value) {},
                        ),
                        SizedBox(height: 25),
                        SizedBox(
                          width: double.infinity,
                          height: 50.0,
                          child: ElevatedButton(
                            child: const Text(
                              'Realizar pago',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        )
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

class widget {}
