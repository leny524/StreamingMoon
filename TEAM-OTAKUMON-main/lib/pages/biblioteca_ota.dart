import 'package:OTAKUMON/pages/registro_screens.dart';
import 'package:flutter/material.dart';
import 'package:OTAKUMON/Herramientas/upBar_ota.dart';
import '../Herramientas/downBar_ota.dart';
import '../Other/config.dart';


class TreeCuadrosConfig{
  final IconData icon;
  final String name,rutac;
  TreeCuadrosConfig({
    required this.icon,
    required this.name,
    required this.rutac,
  });
}

List<TreeCuadrosConfig> TCConfigs = [
  TreeCuadrosConfig(
    icon: Icons.save,
    name: 'Guardar', 
    rutac: 'guardar_ota',
  ),
  TreeCuadrosConfig(
    icon: Icons.history,
    name: 'Historial',
    rutac: 'historial',//este es de historial
    ),
  TreeCuadrosConfig(
    icon: Icons.tune_rounded,
    name: 'Configuracion',
    rutac: 'Config_ota',
  ),
];


class biblioteca extends StatelessWidget  {
  // --- RUTAS ---
  // PARA RUTAS (COPIAR Y PEGAR ANTES DE "@override" DESDE AQUI ...
  // en _selectedIndex coloca un numero entero (del 0 al 3) para seleccionar el icono
  int _selectedIndex = 3;
  void _onItemTapped(int index) {

    _selectedIndex = index;
    
  }
  // ... HASTA AQUI)
// --- RUTAS ---

  final Config config = configPrin;
  final List TreeCuadrosConfig = TCConfigs;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: upBar(),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ConfigUserProfile(config),
            Expanded(child: GridView.builder(
              itemCount: TCConfigs.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
                itemBuilder: (context, index) => WidTreCua(
                  treeCuadrosConfig: TCConfigs[index]
                ),
            )),

          ],
        ),
      ),
      bottomNavigationBar: downBar(inx: _selectedIndex,),
    ); 
  }
}

class WidTreCua extends StatelessWidget {
  final TreeCuadrosConfig treeCuadrosConfig;
  const WidTreCua({
    Key? key, required this.treeCuadrosConfig,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {Navigator.pushNamed(context, treeCuadrosConfig.rutac);},
      child: Container(
        height: 140,
        width: 180,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 18, 72, 126),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(treeCuadrosConfig.icon, size: 120, color: Color.fromARGB(255, 189, 188, 188),),
              Text(treeCuadrosConfig.name,
              style: TextStyle(color: Color.fromARGB(255, 189, 188, 188)),)
            ],
          ),
        ),
      ),
    );
  }
}



// EL PERFIL
class ConfigUserProfile extends StatefulWidget {
  const ConfigUserProfile(Config config, {Key? key}) : super(key: key);
  
  @override
  State<ConfigUserProfile> createState() => _ConfigUserProfile(configPrin);
}

class _ConfigUserProfile extends State<ConfigUserProfile>{

  final Config config;

  _ConfigUserProfile(this.config);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("../assets/norway.jpg"),
          fit: BoxFit.cover,
        )
      ),
      child: ListTile(
        onTap: (){
          Navigator.pushNamed(context, 'carrito_ota');
        },
        leading: Icon(Icons.supervised_user_circle),
        title: Text('perfil'),
        trailing: Icon(Icons.camera_front_outlined),
      ),
    );
  }
}





// LA BARRA DE TRES CONFIGURACIONES LATERALES

class ConfigThree extends StatefulWidget {
  const ConfigThree(Config config, {Key? key}) : super(key: key);
  
  @override
  _ConfigThree createState() => _ConfigThree(configPrin);
}

class _ConfigThree extends State<ConfigThree>{

  final Config config;
  _ConfigThree(this.config);

  @override
  Widget build(BuildContext context) {
    return Text('data');/*Container(
        child: GridView.count(
          crossAxisCount: 3,
          children: <Widget>[
            Card(
              child: Center(
                child: Column(
                  children: [
                    ListTile(
                      onTap: () {
                      Navigator.pushNamed(context, 'carrito_ota');
                    },
                    leading: Icon(Icons.save),
                    title: Text('guardar'),
                    ),
                  ],
                ),
              ),
            ),
              //_ThreeItem(context, Icons.system_update_tv_rounded, 'guardar', 'carrito_ota'),
            ],
          ),
    );*/
  }
/*
  Widget _ThreeItem(BuildContext context, IconData icon, String nombre, String ruta) {
      return Card(
        child: Center(
          child: ListTile(
                onTap: () {
                  Navigator.pushNamed(context, ruta);
                },
                leading: Icon(icon),
                title: Text(nombre),
              ),
        ),
      );
    }*/
}



class ConfigCompras extends StatefulWidget {
  const ConfigCompras(Config config, {Key? key}) : super(key: key);
  
  @override
  _ConfigCompras createState() => _ConfigCompras(configPrin);
}

class _ConfigCompras extends State<ConfigCompras>{

  final Config config;

  _ConfigCompras(this.config);


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Compras'),
    );
  }
}



class ConfigConfig extends StatefulWidget {
  const ConfigConfig(Config config, {Key? key}) : super(key: key);
  
  @override
  _ConfigConfig createState() => _ConfigConfig(configPrin);
}

class _ConfigConfig extends State<ConfigConfig>{

  final Config config;

  _ConfigConfig(this.config);


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Configuracion'),
    );
  }
}