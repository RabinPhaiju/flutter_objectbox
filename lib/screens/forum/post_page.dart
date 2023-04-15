import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_objectbox/screens/forum/post_list.dart';

import '../../main.dart';
import 'add_post.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  void addPost(String title){
    objectBox.addPost(title);
    // setState(() {});
  }

  startAddNewPost(BuildContext ctx){
    showModalBottomSheet(
      useSafeArea: true,
        backgroundColor: Colors.transparent,
        context: ctx,
        builder: (bCtx){
          return GestureDetector(
              behavior: HitTestBehavior.opaque,
              child: NewPost(addPost));
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pocket Pandit'),
      ),
      body: const PostList(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Platform.isIOS? Container() :FloatingActionButton(
        onPressed: ()=>startAddNewPost(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
