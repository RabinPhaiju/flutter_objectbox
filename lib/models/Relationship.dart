import 'package:objectbox/objectbox.dart';

@Entity()
class Relationship {
    @Id()
  int? internalId = 0;
  @Unique(onConflict: ConflictStrategy.replace)
  @Index()
  int? id;



  String title;

  Relationship(this.title,this.id);

}