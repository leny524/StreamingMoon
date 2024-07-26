import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:OTAKUMON/pages/inicio_ota.dart';
import 'package:provider/provider.dart';

void main() => runApp(CarouselDemo());

final themeMode = ValueNotifier(2);

class CarouselDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (context, value, g) {
        return MaterialApp(
          initialRoute: '/',
          darkTheme: ThemeData.dark(),
          themeMode: ThemeMode.values.toList()[value as int],
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (ctx) => CarouselDemoHome(),
            '/prefetch': (ctx) => PrefetchImageDemo()
          },
        );
      },
      valueListenable: themeMode,
    );
  }
}

class DemoItem extends StatelessWidget {
  final String title;
  final String route;
  DemoItem(this.title, this.route);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}

class CarouselDemoHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.keyboard_arrow_left_rounded), onPressed: (){Navigator.pushNamed(context, 'biblioteca_ota');}),
        title: Text('OTAKUMON'),
        actions: [
          IconButton(
              icon: Icon(Icons.nightlight_round),
              onPressed: () {
                themeMode.value = themeMode.value == 1 ? 2 : 1;
              })
        ],
      ),
      body: ListView(
        children: <Widget>[
          DemoItem('Imagenes', '/prefetch'),
        ],
      ),
    );
  }
}

class PrefetchImageDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PrefetchImageDemoState();
  }
}

class _PrefetchImageDemoState extends State<PrefetchImageDemo> {
  final List<String> images = [
    "https://m.media-amazon.com/images/I/81sqMtBYOHS._AC_SL1500_.jpg",
        "https://pbs.twimg.com/media/FMdBsrGXsAQGxQ0?format=jpg&name=4096x4096",
        "https://static.wixstatic.com/media/badb34_1eeeb026dcaf4c9f8f85ea9eda88274f~mv2.png/v1/fill/w_1000,h_1422,al_c,usm_0.66_1.00_0.01/badb34_1eeeb026dcaf4c9f8f85ea9eda88274f~mv2.png",
        "https://images-na.ssl-images-amazon.com/images/I/71-WBN3FCBL._AC_SL1280_.jpg",
        "https://assets.promediateknologi.com/crop/0x0:0x0/x/photo/2021/11/23/3946289368.jpeg",
        "https://images-na.ssl-images-amazon.com/images/I/81MLf-pgXrL.jpg",
        "https://i.ebayimg.com/images/g/nhMAAMXQya1Q8h6k/s-l500.jpg",
        "https://img.assinaja.com/assets/tZ/050/img/270004_520x520.jpg",
        "https://images-na.ssl-images-amazon.com/images/I/81TLeOxDprL.jpg",
        "https://i.ebayimg.com/images/g/tw8AAOSwWi1f~uUU/s-l500.jpg",
        "https://m.media-amazon.com/images/I/81D0Y6+qV9L._SL1500_.jpg",
        "https://m.media-amazon.com/images/I/91oRmZ53OBL._AC_SY679_.jpg",
        "https://m.media-amazon.com/images/I/71uHZO5ChkL._AC_SY679_.jpg",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTivsd7K3EyT2-G69UB4I_4Zh6OGqU42TWFHw&usqp=CAU",
        "https://m.media-amazon.com/images/I/419128OKuGL.jpg"
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      images.forEach((imageUrl) {
        precacheImage(NetworkImage(imageUrl), context);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GUARDADO DE IMAGENES')),
      body: Container(
          child: CarouselSlider.builder(
        itemCount: images.length,
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 2.0,
          enlargeCenterPage: true,
        ),
        itemBuilder: (context, index, realIdx) {
          return Container(
            child: Center(
                child: Image.network(images[index],
                    fit: BoxFit.cover, width: 1000)),
          );
        },
      )),
    );
  }
}