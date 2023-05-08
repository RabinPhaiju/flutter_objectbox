import 'dart:async';

import 'package:path/path.dart' as p;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'models/ForumPost.dart';
import 'models/PostReply.dart';
import 'models/Relationship.dart';
import 'objectbox.g.dart';

class ObjectBox2{
  late final Store store;

  late final Box<ForumPost> forumPostBox;
  late final Box<PostReply> postReplyBox;
  late final Box<Relationship> relationshipBox;

  ObjectBox2._create(this.store){
    forumPostBox = Box<ForumPost>(store);
    postReplyBox = Box<PostReply>(store);
    relationshipBox = Box<Relationship>(store);

    // test
    if(forumPostBox.isEmpty()){
      _putDemoPostReply();
    }
  }

  void _putDemoPostReply() {
    Relationship rel1 = Relationship('rel1',1);
    Relationship rel2 = Relationship('rel2',2);
    Relationship rel3 = Relationship('rel3',3);
    Relationship rel4 = Relationship('rel4',4);

    ForumPost post1 = ForumPost('Post1',1);
    post1.relationship.target = rel1;
    ForumPost post2 = ForumPost('Post2',2);
    post2.relationship.target = rel2;

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
    relationshipBox.putMany([rel3,rel4]);
  }

  static Future<ObjectBox2> create() async{
    final docsDir = await getApplicationDocumentsDirectory();
    final store = await openStore(directory: p.join(docsDir.path, "objectbox2"));
    return ObjectBox2._create(store);
  }

  void addPostReply(String replyText,ForumPost post){
    PostReply newReply =  PostReply(replyText);
    post.replies.add(newReply);

    postReplyBox.put(newReply);
    debugPrint('Add reply ${newReply.content} of post ${newReply.post.target?.title}');
  }

  int addPost(String newPost,String rel,String reply1){
    Relationship _rel = Relationship(rel,5);
    PostReply _reply1 = PostReply(reply1);
    ForumPost postTOAdd = ForumPost(newPost,33);
    postTOAdd.relationship.target = _rel;
    postTOAdd.replies.add(_reply1);

    int newPostId = forumPostBox.put(postTOAdd);
    return newPostId;
  }

  Stream<List<ForumPost>> getForumPosts(){
    final builder = forumPostBox.query()..order(ForumPost_.id,flags: Order.descending);
    return builder.watch(triggerImmediately: true).map((query) => query.find());
  }
  Stream<List<Relationship>> getRelations(){
    final builder = relationshipBox.query()..order(Relationship_.id,flags: Order.descending);
    return builder.watch(triggerImmediately: true).map((query) => query.find());
  }

  Stream<List<PostReply>> getPostReplies(){
    final builder = postReplyBox.query()..order(PostReply_.id,flags: Order.descending);
    return builder.watch(triggerImmediately: true).map((query) => query.find());
  }


}

