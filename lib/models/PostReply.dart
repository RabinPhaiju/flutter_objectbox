import 'package:objectbox/objectbox.dart';

import 'ForumPost.dart';

@Entity()
class PostReply {
  @Id()
  int id;

  String content;
  PostReply(this.content, {this.id = 0});

  final replies = ToMany<PostReply>();

  final post = ToOne<ForumPost>();

}