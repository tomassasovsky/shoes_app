import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/src/models/shoe_model.dart';

import 'package:shoes_app/src/pages/shoe_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ShoeModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void loadImages() {
    precacheImage(AssetImage('assets/verde.png'), context);
    precacheImage(AssetImage('assets/negro.png'), context);
    precacheImage(AssetImage('assets/azul.png'), context);
    precacheImage(AssetImage('assets/amarillo.png'), context);
  }

  @override
  void initState() {
    loadImages();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    loadImages();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: ShoePage(),
    );
  }
}
