import 'package:flutter/material.dart';

import '../main.dart';
import '../models/ForumPost.dart';

class MenuElement {
  final String? text;
  const MenuElement({required this.text});
}

class MenuItems {
  static const itemDelete = MenuElement(text: 'Delete');
  static const List<MenuElement> itemFirst = [itemDelete];
}


class PocketPopupMenuButton extends StatefulWidget {
  final ForumPost post;
  const PocketPopupMenuButton({Key? key,required this.post}) : super(key: key);

  @override
  State<PocketPopupMenuButton> createState() => _PocketPopupMenuButtonState();
}

class _PocketPopupMenuButtonState extends State<PocketPopupMenuButton> {
  PopupMenuItem<MenuElement> buildItem(MenuElement item) =>
      PopupMenuItem<MenuElement>(value: item,child: Text(item.text!),);

  void onSelected(BuildContext context, ForumPost post){
    // objectBox.forumPostBox.remove(post.id);
    objectBox.forumPostBox.removeAsync(post.id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MenuElement>(
      onSelected: (item)=>onSelected(context,widget.post),
      itemBuilder: (BuildContext context) => [...MenuItems.itemFirst.map(buildItem).toList()],
      child: const Padding(padding: EdgeInsets.all(2.0),child: Icon(color: Colors.grey,Icons.more_horiz),),
    );
  }
}
