import 'package:hive/hive.dart';
part 'note_model.g.dart';
  // hive : it's a local database in flutter ,
  //1- to save object in hive i should make class extends from HiveObject
  // 2- create and generate  type adabtor for my object
  //3 - we should give an typeid to class/object i will create @HiveType(typeId: 0)
  // 4- give an typeid to fields  @HiveField(0)
  //5- add the generate package : part 'note_model.g.dart'; (note_model = like class name)
  //6- run this code in terminal (flutter packages pub run build_runner build)  to generate hive object
  // 7-go to main.dart and intialize Hive
   
  
  @HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
   String title;
  @HiveField(1)
   String subTitle;
  @HiveField(2)
  final String date;
  @HiveField(3)
   int color;

  NoteModel(
      {required this.title,
      required this.subTitle,
      required this.date,
      required this.color});
}
