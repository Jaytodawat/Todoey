import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 0)
class Task extends HiveObject{
  @HiveField(0)
  final String name;
  @HiveField(1)
  bool isDone;
  Task({required this.name, required this.isDone});

  void toggleDone() {
    isDone = !isDone;
  }
}
