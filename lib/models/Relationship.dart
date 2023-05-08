import 'package:flutter_objectbox/models/ForumPost.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Relationship {
  @Id(assignable: true)
  int id= 0;
  String title;

  @Backlink()
  final posts = ToMany<ForumPost>();

  Relationship(this.title,this.id);

}