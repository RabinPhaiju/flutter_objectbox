import 'package:objectbox/objectbox.dart';

import 'PostReply.dart';

@Entity()
class ForumPost {
  @Id()
  int id;

  String title;
  bool draft;

  @Backlink()
  final replies = ToMany<PostReply>();

  ForumPost(this.title, {this.id = 0, this.draft = false});

  bool setPosted(){
    draft = false;
    return draft;
  }
}