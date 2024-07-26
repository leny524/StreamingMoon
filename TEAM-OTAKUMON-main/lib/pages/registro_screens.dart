
import 'package:flutter/material.dart';
import "package:flutter/src/material/colors.dart";

class Registro extends StatefulWidget {
  const Registro({Key? key}) : super(key: key);

  _Registro createState() => _Registro();
}

class _Registro extends State<Registro> {
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
                      Navigator.pushNamed(context, 'ruta_login_2');
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    label: Text('Back', style: TextStyle(color: Colors.white))),
              ],
            ),

            /* child: FlatButton(
              height: 1.0,
              minWidth: 200.0,
              //padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child:
                  /* Align(
              alignment: FractionalOffset(0.2, 0.6), */

                  Container(
                      child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const <Widget>[
                  Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 30.0,
                    // semanticLabel: 'Text to announce in accessibility modes',
                  ),
                ],
              )
                      /* Row{
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const <Widget>[
                      Icon(
                      Icons.favorite)     
                      ],
                      }, */
                      /* Icon(Icons.audiotrack,
                  color: Colors.green,
                  size: 30.0,
                ), */
                      // width: double.infinity,
                      /* child: const Text(
                  'Back', */

                      /* children: <Widget>[
                  Text(
                    'Back',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                  ),
                  Icon(Icons.card_giftcard),
                ], */
                      /* style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                ), */
                      ),
              onPressed: () {},
            ), */
          ),
          Container(
              padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 150.0),
              child: Image.asset('../assets/otakumon.png', height: 175)),
          /* child: Image.asset(
              "assets/otakumon.png",
              /* ,color: Colors.white */
              height: 150.0,
              ), */
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
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(labelText: "Nombres "),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(labelText: "Apellidos "),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                          decoration: InputDecoration(
                        labelText: 'Ingrese Gmail',
                      )),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(labelText: "Contraseña "),
                        obscureText: true,
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration:
                            InputDecoration(labelText: "Confirmar contraseña "),
                        obscureText: true,
                      ),
                      SizedBox(height: 25),
                      SizedBox(
                        width: double.infinity,
                        height: 50.0,
                        child: ElevatedButton(
                          child: const Text(
                            'Registrarse',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
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
        ],
      ),
    );
  }
}

class widget {}
