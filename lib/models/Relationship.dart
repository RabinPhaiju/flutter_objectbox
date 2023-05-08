import 'package:objectbox/objectbox.dart';

@Entity()
class Relationship {
  @Id()
  int internalId = 0;
  int? id;
  String title;

  Relationship(this.title,this.id);

}