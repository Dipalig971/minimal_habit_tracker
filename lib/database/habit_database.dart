import 'package:flutter/widgets.dart';
import 'package:isar/isar.dart';
import 'package:minimal_habit_tracker/modal/app_settings.dart';
import 'package:minimal_habit_tracker/modal/habit.dart';
import 'package:path_provider/path_provider.dart';

class HabitDatabase extends ChangeNotifier {
  static late Isar isar;

  /*

   S E T U P
   */

// INITIALIZE-DATABASE

  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar =
        await Isar.open([HabitSchema, AppSettingSchema], directory: dir.path);
  }

//save first data of app startup(for heatmap)
Future<void> saveFirstLaunchDate() async {
    final existingSettings = await isar.appSettings.where().findFirst();

    if(existingSettings == null){
      final settings = AppSetting()..firstLaunchDate = DateTime.now();
     await isar.writeTxn(() => isar.appSettings.put(settings));
    }
}
//Get first data of app startup(for heatmap)
Future<DateTime?> getFirstLaunchDate() async {
    final settings = await isar.appSettings.where().findFirst();
    return settings?.firstLaunchDate;
}
/*
C R U D * O P E R A T I O N S
 */

// List of habits
final List<Habit> currentHabit = [];
// C R E A T E - add a new habit
Future<void> addHabit(String habitname) async {
  // create a new habit
  final newhabit = Habit()..name = habitname;

  // save to db
  await isar.writeTxn(() => isar.habits.put(newhabit));

  // re-read from db
}
//R E A D - read save habits from db
// U P D A T E - check habit on and off
// U P D A T E - edit habit name
//D E L E T E - delete habit
}
