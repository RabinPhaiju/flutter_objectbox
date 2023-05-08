import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_objectbox/screens/forum/post_list.dart';

import '../../main.dart';
import 'add_post.dart';

class PostPage extends StatefulWidget {
  final String boxType;
  const PostPage({Key? key,required this.boxType}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  void addPost(String id,String relId,String title,String reply,String rel){
    if(widget.boxType == 'objectbox1'){
      objectBox.addPost(id,relId,title,rel,reply);
    }else{
      objectBox2.addPost(title,rel,reply);
    }
    // setState(() {});
  }

  startAddNewPost(BuildContext ctx){
    showModalBottomSheet(
      isScrollControlled: true,
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
      body: PostList(boxType : widget.boxType),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Platform.isIOS? Container() :FloatingActionButton(
        onPressed: ()=>startAddNewPost(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
