import 'package:flutter/material.dart';
import 'package:flutter_objectbox/screens/forum/relation_list.dart';

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
              child: const Text('Forum')),
          ElevatedButton(
              onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder:(context) => const RelationList()));
                },
              child: const Text('Relationship'))
        ],
      ),
    );
  }
}
