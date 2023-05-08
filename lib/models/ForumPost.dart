import 'package:flutter_objectbox/models/Relationship.dart';
import 'package:objectbox/objectbox.dart';


import 'PostReply.dart';

@Entity()
class ForumPost {
  @Id(assignable: true)
  int id= 0;

  String title;
  bool draft;

  final relationship = ToOne<Relationship>();

  @Backlink()
  final replies = ToMany<PostReply>();

  ForumPost(this.title, this.id , {this.draft = false});

  bool setPosted(){
    draft = false;
    return draft;
  }
}