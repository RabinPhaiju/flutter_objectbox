import 'package:objectbox/objectbox.dart';

@Entity()
class User {
  @Id(assignable: true)
  int id= 0;
  String name;

  User(this.name,this.id);

}