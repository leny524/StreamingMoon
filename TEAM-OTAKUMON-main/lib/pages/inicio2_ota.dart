import 'package:OTAKUMON/pages/registro_screens.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:OTAKUMON/models/inicioproducto.dart';
import 'package:OTAKUMON/providers/inicioproducto_provider.dart';
import '../Herramientas/upBar_ota.dart';
import '../Herramientas/downBar_ota.dart';

class InicioProductoScreen extends StatefulWidget {
  const InicioProductoScreen({Key? key}) : super(key: key);

  @override
  State<InicioProductoScreen> createState() => _InicioProductoScreenState();
}

class _InicioProductoScreenState extends State<InicioProductoScreen> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final inicioproductoProvider = Provider.of<InicioproductoProvider>(context);
    final List<Inicioproducto> listaInicioproductos =
        inicioproductoProvider.listaInicioproductos;
    //

    return Scaffold(
      appBar: upBar(),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),

              Container(
                width: double.infinity,
                height: 510,
                color: Colors.white,
                child: Swiper(
                  itemCount: listaInicioproductos.length,
                  layout: SwiperLayout.STACK,
                  itemWidth: 280,
                  itemHeight: 480,
                  itemBuilder: (BuildContext context, int index) {
                    return _cardInicioproducto(listaInicioproductos[index]);
                  },
                ),
              ),
              //??????????????????????? AQUI VA EL CODIGO ?????????????????????????//

              /*
              // LISTA DE PRODUCTOS IMAGENES
              GridView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 225,
                    // PROPORCION DE LA FORMA: ANCHO / ALTURA
                    childAspectRatio: 2 / 2.8,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: listaInicioproductos.length,
                itemBuilder: (BuildContext count, index) {
                  return Container(
                    alignment: Alignment.center,
                    child: Image(
                        // imagen que se encuentra publicada en el internet
                        image:
                            NetworkImage(listaInicioproductos[index].imagen)),
                  );
                },
              ),
              */

              GridView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 225,
                      // PROPORCION DE LA FORMA: ANCHO / ALTURA
                      childAspectRatio: 2 / 2.8,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: listaInicioproductos.length,
                  itemBuilder: (BuildContext count, index) {
                    return _gridimagenesInicioproducto(
                        listaInicioproductos[index]);
                  })

              //??????????????????????? AQUI VA EL CODIGO ?????????????????????????//

              // LISTA DE PRODUCTOS
              ,
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: listaInicioproductos.length,
                  itemBuilder: (BuildContext count, index) {
                    return _listInicioproducto(listaInicioproductos[index]);
                  })
            ],
          ),
        ),
      ),
      bottomNavigationBar: downBar(
        inx: _selectedIndex,
      ),
    );
  }
}

class _cardInicioproducto extends StatelessWidget {
  final Inicioproducto inicioproducto;
  _cardInicioproducto(this.inicioproducto);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Image(
          image: NetworkImage(inicioproducto.imagen), /*fit: BoxFit.fill,*/
        ),
        Container(
          width: double.infinity,
          height: 70,
          color: Color.fromARGB(255, 25, 77, 145),
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Center(
            child: Text(
              inicioproducto.titulo,
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      ],
    ));
  }
}

// ?????????????????????????? AQUI

class _gridimagenesInicioproducto extends StatelessWidget {
  final Inicioproducto inicioproducto;
  _gridimagenesInicioproducto(this.inicioproducto);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 200,
        height: 300,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(inicioproducto.imagen), fit: BoxFit.cover),
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, "productounitario_ota",
            arguments: inicioproducto);
      },
    )
        /*
    Image(
      image: NetworkImage(inicioproducto.imagen),
      height: 225,
    );*/
        ;
  }
}

class _listInicioproducto extends StatelessWidget {
  final Inicioproducto inicioproducto;
  _listInicioproducto(this.inicioproducto);
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Divider(),
            SizedBox(
              height: 20,
            ),
            Text(
              inicioproducto.titulo,
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 25, 77, 145)),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: NetworkImage(inicioproducto.imagen),
                  height: 225,
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          inicioproducto.descripcion,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "S/. " + inicioproducto.precio.toString(),
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 25, 77, 145)),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                            icon: const Icon(Icons.edit,
                                color: Color.fromARGB(255, 25, 77, 145)),
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, 'modificarproducto_ota',
                                  arguments: inicioproducto);
                            }),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ));
    ;
  }
}
