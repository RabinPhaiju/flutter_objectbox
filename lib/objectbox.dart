import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'models/ForumPost.dart';
import 'models/PostReply.dart';
import 'objectbox.g.dart';

class ObjectBox{
  late final Store store;

  late final Box<ForumPost> forumPostBox;
  late final Box<PostReply> postReplyBox;

  ObjectBox._create(this.store){
    forumPostBox = Box<ForumPost>(store);
    postReplyBox = Box<PostReply>(store);

    // test
    if(forumPostBox.isEmpty()){
      _putDemoPostReply();
    }
  }

  void _putDemoPostReply() {
    ForumPost post1 = ForumPost('Post1');
    ForumPost post2 = ForumPost('Post12');

    PostReply reply1 = PostReply('reply1 of post 1');
    post1.replies.add(reply1);

    PostReply reply1Reply1 = PostReply('reply1 of reply 1 of post 1');
    reply1.replies.add(reply1Reply1);

    PostReply reply2 = PostReply('reply2 of post 2');
    post2.replies.add(reply2);

    PostReply reply2Reply1 = PostReply('reply2 of reply 1 of post 1');
    reply2.replies.add(reply2Reply1);

    // putting reply will also put if new post cause they have relation.
    forumPostBox.putMany([post1,post2]);
  }

  static Future<ObjectBox> create() async{
    final store = await openStore();
    return ObjectBox._create(store);
  }

  void addPostReply(String replyText,ForumPost post){
    PostReply newReply =  PostReply(replyText);
    post.replies.add(newReply);

    postReplyBox.put(newReply);
    debugPrint('Add reply ${newReply.content} of post ${newReply.post.target?.title}');
  }

  int addPost(String newPost){
    ForumPost postTOAdd = ForumPost(newPost);
    int newPostId = forumPostBox.put(postTOAdd);
    return newPostId;
  }

  Stream<List<ForumPost>> getForumPosts(){
    final builder = forumPostBox.query()..order(ForumPost_.id,flags: Order.descending);
    return builder.watch(triggerImmediately: true).map((query) => query.find());
  }

  Stream<List<PostReply>> getPostReplies(){
    final builder = postReplyBox.query()..order(PostReply_.id,flags: Order.descending);
    return builder.watch(triggerImmediately: true).map((query) => query.find());
  }


}

