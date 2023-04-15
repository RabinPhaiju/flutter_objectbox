import 'package:flutter/material.dart';

import 'forum/post_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pocket Pandit'),
      ),
      body: Column(
        children: <Widget>[
          ElevatedButton(
              onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder:(context) => const PostPage()));
                },
              child: const Text('Forum'))
        ],
      ),
    );
  }
}
