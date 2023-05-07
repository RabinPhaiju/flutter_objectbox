import 'dart:async';
import 'package:path/path.dart' as p;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'models/ForumPost.dart';
import 'models/PostReply.dart';
import 'models/Relationship.dart';
import 'objectbox.g.dart';

class ObjectBox{
  late final Store store;

  late final Box<ForumPost1> forumPostBox1;
  late final Box<ForumPost2> forumPostBox2;
  
  late final Box<PostReply> postReplyBox;
  late final Box<Relationship> relationshipBox;

  ObjectBox._create(store){
    forumPostBox1 = Box<ForumPost1>(store);
    forumPostBox2 = Box<ForumPost2>(store);
    
    postReplyBox = Box<PostReply>(store);
    relationshipBox = Box<Relationship>(store);

    // test
    if(forumPostBox1.isEmpty()){
      _putDemoPostReply(forumPostBox1);
      _putDemoPostReply(forumPostBox2);
    }
  }

  void _putDemoPostReply(box) {
    Relationship rel1 = Relationship('rel1',1);
    Relationship rel2 = Relationship('rel2',2);
    Relationship rel3 = Relationship('rel3',3);
    Relationship rel4 = Relationship('rel4',4);

    ForumPost post1 = ForumPost('Post1');
    post1.relationship.target = rel1;
    ForumPost post2 = ForumPost('Post12');
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
    box.putMany([post1,post2]);
    relationshipBox.putMany([rel3,rel4]);
  }

  static Future<ObjectBox> create() async{
    final docsDir = await getApplicationDocumentsDirectory();
    final store = await openStore(directory: p.join(docsDir.path, "objectbox1"));
    return ObjectBox._create(store);

  }

  void addPostReply(String replyText,ForumPost post){
    PostReply newReply =  PostReply(replyText);
    post.replies.add(newReply);

    postReplyBox.put(newReply);
    debugPrint('Add reply ${newReply.content} of post ${newReply.post.target?.title}');
  }

  int addPost(box,String newPost,String rel,String reply1){
    Relationship _rel = Relationship(rel,5);
    PostReply _reply1 = PostReply(reply1);
    ForumPost postTOAdd = ForumPost(newPost);
    postTOAdd.relationship.target = _rel;
    postTOAdd.replies.add(_reply1);

    int newPostId = box.put(postTOAdd);
    return newPostId;
  }

  Stream<List<ForumPost>> getForumPosts(box){
    final builder = box.query()..order(ForumPost_.id,flags: Order.descending);
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

