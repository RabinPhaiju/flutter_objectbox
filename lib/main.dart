import 'package:flutter/material.dart';
import 'package:flutter_objectbox/objectbox.dart';
import 'package:flutter_objectbox/screens/home_page.dart';

import 'objectbox.g.dart';
import 'objectbox2.dart';
// import 'package:flutter/rendering.dart';

late ObjectBox objectBox;
late ObjectBox2 objectBox2;
late Admin admin;

void main() async {
  // debugPaintSizeEnabled = true;

  WidgetsFlutterBinding.ensureInitialized();

  objectBox = await ObjectBox.create();
  objectBox2 = await ObjectBox2.create();

  if (Admin.isAvailable()) {
    // Keep a reference until no longer needed or manually closed.
    admin = Admin(objectBox.store);
  }

// (Optional) Close at some later point.
//   admin.close();

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

