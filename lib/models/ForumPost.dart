import 'package:flutter_objectbox/models/Relationship.dart';
import 'package:objectbox/objectbox.dart';


import 'PostReply.dart';

@Entity()
class ForumPost {
  @Id()
  int id;

  String title;
  bool draft;

  final relationship = ToOne<Relationship>();

  @Backlink()
  final replies = ToMany<PostReply>();

  ForumPost(this.title, {this.id = 0, this.draft = false});

  bool setPosted(){
    draft = false;
    return draft;
  }
}

@Entity()
class ForumPost1 extends ForumPost {
  @Id()
  int internal_id;
  ForumPost1(String title,this.internal_id) : super(title);

}

@Entity()
class ForumPost2 extends ForumPost {
  @Id()
  int internal_id;
  ForumPost2(String title,this.internal_id) : super(title);

}