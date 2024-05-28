import 'package:isar/isar.dart';

//dart run build_runner build
part 'app_settings.g.dart';

@Collection()
class AppSetting{
  Id id = Isar.autoIncrement;
  DateTime? firstLaunchDate;
}