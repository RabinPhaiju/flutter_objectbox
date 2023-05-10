import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/ForumPost.dart';
import '../../widgets/popup_menu_button.dart';

class PostListCard extends StatefulWidget {
  final ForumPost post;
  const PostListCard({Key? key,required this.post}) : super(key: key);

  @override
  State<PostListCard> createState() => _PostListCardState();
}

class _PostListCardState extends State<PostListCard> {

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 140,
        margin: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 243, 243, 243),
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 168, 168, 168),
              blurRadius: 5.0,
              offset: Offset(1, 2),
            )
          ]
        ),
        child: Row(
          children: <Widget>[
            Expanded(
                child: Column(
                  children: <Widget>[
                    Text(widget.post.title),
                    Text('id ${widget.post.id.toString()}'),
                    Text(widget.post.replies.length.toString()),
                    Text(widget.post.relationship.target != null ? widget.post.relationship.target!.title : ''),
                    Text('id${widget.post.relationship.target != null ? widget.post.relationship.target!.id.toString() : ''}'),
                    Text(widget.post.user.target != null ? widget.post.user.target!.name : ''),
                    Text('id${widget.post.user.target != null ? widget.post.user.target!.id.toString() : ''}'),
                    Text('price ${widget.post.price.toString()}'),
                  ],
                )
            ),
            PocketPopupMenuButton(post: widget.post),
          ],
        ),
    );
  }
}
