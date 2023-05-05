import 'package:flutter/material.dart';
import 'package:flutter_objectbox/objectbox.dart';
import 'package:flutter_objectbox/screens/home_page.dart';

import 'objectbox2.dart';
// import 'package:flutter/rendering.dart';

late ObjectBox objectBox;
late ObjectBox2 objectBox2;

void main() async {
  // debugPaintSizeEnabled = true;

  WidgetsFlutterBinding.ensureInitialized();

  objectBox = await ObjectBox.create();
  objectBox2 = await ObjectBox2.create();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PocketPandit',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

