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
      body: ListView(
        children :[
          Row(
            children: <Widget>[
              Text('box1'),
              SizedBox(width: 10,),
              ElevatedButton(
                  onPressed: (){
                    Navigator.push(context,MaterialPageRoute(builder:(context) =>  const PostPage(boxType: 'objectbox1')));
                  },
                  child: const Text('Forum 1')),
              SizedBox(width: 10,),
              ElevatedButton(
                  onPressed: (){
                    Navigator.push(context,MaterialPageRoute(builder:(context) => const RelationList(boxType: 'objectbox1')));
                  },
                  child: const Text('Relationship 1'))
            ],
          ),
          Row(
            children: <Widget>[
              Text('box2'),
              SizedBox(width: 10,),
              ElevatedButton(
                  onPressed: (){
                    Navigator.push(context,MaterialPageRoute(builder:(context) => const PostPage(boxType: 'objectbox2')));
                  },
                  child: const Text('Forum 2')),
              SizedBox(width: 10,),
              ElevatedButton(
                  onPressed: (){
                    Navigator.push(context,MaterialPageRoute(builder:(context) => const RelationList(boxType: 'objectbox2')));
                  },
                  child: const Text('Relationship 2'))
            ],
          ),
        ]
      ),
    );
  }
}
