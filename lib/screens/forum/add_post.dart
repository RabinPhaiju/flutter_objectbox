import 'package:flutter/material.dart';

class NewPost extends StatefulWidget {
  final Function addPost;

  const NewPost(this.addPost, {super.key});

  @override
  State<NewPost> createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  final _titleController = TextEditingController();
  final _replyController = TextEditingController();
  final _relationController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    void submitPost(){
      final enteredTitle = _titleController.text;
      final enteredReply = _replyController.text;
      final enteredRelation = _relationController.text;

      if(enteredTitle.isEmpty){return;}
      // widget only available in stateful
      // widget is special property that gives access to the context of your Widget
      widget.addPost(enteredTitle,enteredReply,enteredRelation);
      // close bottom sheet
      Navigator.of(context).pop();
    }

    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              // Text(MediaQuery.of(context).viewInsets.bottom.toString()),
              TextField(
                decoration: const InputDecoration(labelText: 'Title'),
                controller: _titleController,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Reply'),
                controller: _replyController,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Relationship'),
                controller: _relationController,
              ),

              ElevatedButton(
                  onPressed: (){
                    submitPost();
                  },
                  child: const Text('Add')
              )
            ],
          ),
        ),
      ),
    );
  }
}
