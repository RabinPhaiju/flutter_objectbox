import 'package:objectbox/objectbox.dart';

@Entity()
class Relationship {
  @Id(assignable: true)
  int id= 0;
  String title;

  Relationship(this.title,this.id);

}