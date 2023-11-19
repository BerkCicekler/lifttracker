import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lifttracker/product/model/workout_model.dart';

/// Hive manager class for caching actions
final class HiveCacheManager {
  HiveCacheManager._();

  /// this method will create an empty workout program with class
  /// then save it in the device
  /// [name] workout program name
  static Future<void> createWorkOutProgram({required String name}) async {
    final workoutProgramBox =
        await Hive.openBox<WorkoutModel>('workoutPrograms');
    final WorkoutModel emptyWorkoutModel =
        WorkoutModel(workoutName: name, exercises: {});
    await workoutProgramBox.add(emptyWorkoutModel);
  }

  /// this method will remove the workout program
  /// with the same id given the arg
  /// [id] Hive box id
  static Future<void> removeWorkOutProgram({required int id}) async {
    final workoutProgramBox =
        await Hive.openBox<WorkoutModel>('workoutPrograms');
    await workoutProgramBox.deleteAt(id);
  }

  /// this function will return all the saved workout programs
  /// as in order
  static Future<Map<int, WorkoutModel>> getAllWorkoutModels() async {
    final workoutProgramBox =
        await Hive.openBox<WorkoutModel>('workoutPrograms');

    return Map<int, WorkoutModel>.from(
      (workoutProgramBox.toMap() as Map<dynamic, dynamic>),
    );
  }
}
