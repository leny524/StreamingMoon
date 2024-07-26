import 'package:flutter/material.dart';



class upBar extends  StatelessWidget with PreferredSizeWidget{

@override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 25, 77, 145),
      title: Text('OTAKUMON'),
      actions: [
        IconButton(icon: Icon(Icons.add_shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, "carrito_ota");
              },
            padding: EdgeInsets.symmetric(horizontal: 10),
        ),
        IconButton(
            icon: Icon(Icons.login),
            onPressed: () {
              Navigator.pushNamed(context, "ruta_login_2");
            },
            padding: EdgeInsets.symmetric(horizontal: 20),
          ),
      ],
      
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);







}

