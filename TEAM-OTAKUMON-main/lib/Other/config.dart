import 'package:flutter/material.dart';



class Config {
  String userName, userAsset, guardado, compras, configuracion;


  Config({ 
    required this.userName,
    required this.userAsset,
    required this.guardado,
    required this.compras,
    required this.configuracion
    });
}

  final configPrin = Config(
    userName: 'User',
    userAsset: 'assets/otakumon.png',
    guardado: 'guardado',
    compras: 'compras',
    configuracion: 'configuraciones'
  );




