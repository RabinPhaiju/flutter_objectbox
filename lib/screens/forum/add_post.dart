import 'package:flutter/material.dart';

class NewPost extends StatefulWidget {
  final Function addPost;

  const NewPost(this.addPost, {super.key});

  @override
  State<NewPost> createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  final _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    void submitPost(){
      final enteredTitle = _titleController.text;

      if(enteredTitle.isEmpty){return;}
      // widget only available in stateful
      // widget is special property that gives access to the context of your Widget
      widget.addPost(enteredTitle);
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
