import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset('assets/imgs/NARUTO.jpg'),
            Text(
              'Este es un buen anime 100% recomenado',
            ),
            Text(
              'Esto forma parte de mi infancia',
            ),
            Text(
              'Todos los capitulos son excelentes recominendo este anime a todo el mundo',
            ),
            Text(
              'Recien empecé a verla y está muy buena',
            ),
            Text(
              'Es el anime más comercial',
            ),
            MaterialButton(
              onPressed: () {},
              elevation: 10.0,
              minWidth: 170.0,
              height: 50.0,
              color: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                'Comentar',
                style: TextStyle(
                  color: Color.fromARGB(255, 129, 41, 41),
                  fontSize: 20.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
