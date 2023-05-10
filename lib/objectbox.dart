import 'dart:async';
import 'package:path/path.dart' as p;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'models/ForumPost.dart';
import 'models/PostReply.dart';
import 'models/Relationship.dart';
import 'models/User.dart';
import 'objectbox.g.dart';

class ObjectBox{
  late final Store store;

  late final Box<ForumPost> forumPostBox;
  late final Box<PostReply> postReplyBox;
  late final Box<Relationship> relationshipBox;
  late final Box<User> userBox;

  ObjectBox._create(this.store){
    forumPostBox = Box<ForumPost>(store);
    postReplyBox = Box<PostReply>(store);
    relationshipBox = Box<Relationship>(store);
    userBox = Box<User>(store);

    // test
    if(forumPostBox.isEmpty()){
      _putDemoPostReply();
    }
  }

  void _putDemoPostReply() {
    // 1 forum-> relation
    // 2 store relation first
    // 3. store user 2nd
    // last forum store

    Relationship rel1 =  Relationship('rel1',1);
    addIfNotExist(relationshipBox,rel1);
    Relationship rel2 = Relationship('rel2',2);
    addIfNotExist(relationshipBox,rel2);

    User usr1 = User('user1',1);
    addIfNotExist(userBox,usr1);

    User usr2 = User('user2',2);
    addIfNotExist(userBox,usr2);

    ForumPost post1 = ForumPost('Post1',1,100);
    post1.relationship.targetId = rel1.id;
    post1.user.targetId = usr1.id;

    ForumPost post2 = ForumPost('Post2',2,200);
    post2.relationship.targetId = rel2.id;
    post2.user.targetId = usr2.id;

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
    final docsDir = await getApplicationDocumentsDirectory();
    final store = await openStore(directory: p.join(docsDir.path, "objectbox1"));
    // Check if migration is required
    return ObjectBox._create(store);
  }

  void addIfNotExist(box,object){
    // dont use this function for all box. use seperate.
    final containsObject = box.contains(object.id);
    if(containsObject == false){
      box.put(object);
      print('--- put ${object.id}');
    }
  }

  void addPostReply(String replyText,ForumPost post){
    PostReply newReply =  PostReply(replyText);
    post.replies.add(newReply);

    postReplyBox.put(newReply);
    debugPrint('Add reply ${newReply.content} of post ${newReply.post.target?.title}');
  }

  void addPost(String price,String userId,String userName,String id,String relId,String newPost,String rel,String reply1){
    Relationship _rel = Relationship(rel,int.parse(relId));
    addIfNotExist(relationshipBox,_rel);

    User _user = User(userName,int.parse(userId));
    addIfNotExist(userBox, _user);

    PostReply _reply1 = PostReply(reply1);
    ForumPost postTOAdd = ForumPost(newPost,int.parse(id),300);
    postTOAdd.relationship.targetId = _rel.id;
    postTOAdd.user.targetId = _user.id;
    postTOAdd.replies.add(_reply1);
    postTOAdd.price = double.parse(price);

    forumPostBox.put(postTOAdd);
  }

  Stream<List<ForumPost>> getForumPosts(){
    final builder = forumPostBox.query()..order(ForumPost_.id,flags: Order.descending);
    return builder.watch(triggerImmediately: true).map((query) => query.find());
  }
  Stream<List<Relationship>> getRelations(){
    final builder = relationshipBox.query()..order(Relationship_.id,flags: Order.descending);
    return builder.watch(triggerImmediately: true).map((query) => query.find());
  }
  Stream<List<User>> getUsers(){
    final builder = userBox.query()..order(User_.id,flags: Order.descending);
    return builder.watch(triggerImmediately: true).map((query) => query.find());
  }

  Stream<List<PostReply>> getPostReplies(){
    final builder = postReplyBox.query()..order(PostReply_.id,flags: Order.descending);
    return builder.watch(triggerImmediately: true).map((query) => query.find());
  }

}
