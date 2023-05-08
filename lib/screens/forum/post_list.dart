import 'package:flutter/cupertino.dart';
import 'package:flutter_objectbox/screens/forum/post_list_card.dart';
import '../../main.dart';
import '../../models/ForumPost.dart';

class PostList extends StatefulWidget {
  final String boxType;
  const PostList({Key? key,required this.boxType}) : super(key: key);

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {

  PostListCard Function(BuildContext,int) _itemBuilder(List<ForumPost> posts){
    return (BuildContext context,int index){
      return PostListCard(post : posts[index]);
    };
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
          key: UniqueKey(),
          stream: widget.boxType=='objectbox1' ? objectBox.getForumPosts() : objectBox2.getForumPosts(),
          builder: (context,snapshot){
            if(snapshot.data?.isNotEmpty ?? false ){
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.hasData ? snapshot.data!.length : 0,
                  itemBuilder: _itemBuilder(snapshot.data ?? []));
            }else{
              return const Center(child: Text('Add new Post'),);
            }
          },
    );
  }
}
