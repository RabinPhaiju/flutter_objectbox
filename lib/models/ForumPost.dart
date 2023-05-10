import 'package:flutter_objectbox/models/Relationship.dart';
import 'package:objectbox/objectbox.dart';


import 'PostReply.dart';
import 'User.dart';

@Entity()
class ForumPost {
  @Id(assignable: true)
  int id= 0;

  @Property(uid: 8039045720462395008)
  double price;

  String title;
  bool draft;

  var relationship = ToOne<Relationship>();
  var user = ToOne<User>();

  @Backlink()
  final replies = ToMany<PostReply>();

  ForumPost(this.title, this.id,this.price, {this.draft = false});

  bool setPosted(){
    draft = false;
    return draft;
  }
}