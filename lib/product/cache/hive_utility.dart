import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lifttracker/product/constants/cache_hive_box_constants.dart';
import 'package:lifttracker/product/model/training_done_model.dart';
import 'package:lifttracker/product/model/workout_model.dart';
import 'package:lifttracker/product/utils/date_format_utils.dart';

/// Hive manager class for caching actions
final class CacheManager {
  CacheManager._();

  /// this method will create an empty workout program with class
  /// then save it in the device
  /// [name] workout program name
  static Future<void> createWorkOutProgram({required String name}) async {
    final workoutProgramBox = await Hive.openBox<WorkoutModel>(
      CacheHiveBoxConstants.workoutModelBox,
    );
    final emptyWorkoutModel = WorkoutModel(workoutName: name, exercises: []);
    await workoutProgramBox.add(emptyWorkoutModel);
  }

  /// a method for updating a workout program
  /// [index] box index of workout program that will
  /// change
  /// [model] new workout model
  static Future<void> updateWorkOutProgram({
    required int index,
    required WorkoutModel model,
  }) async {
    final workoutProgramBox = await Hive.openBox<WorkoutModel>(
      CacheHiveBoxConstants.workoutModelBox,
    );
    await workoutProgramBox.put(index, model);
  }

  /// this method will remove the workout program
  /// with the same id given the arg
  /// [id] Hive box id
  static Future<void> removeWorkOutProgram({required int id}) async {
    final workoutProgramBox = await Hive.openBox<WorkoutModel>(
      CacheHiveBoxConstants.workoutModelBox,
    );
    await workoutProgramBox.deleteAt(id);
  }

  /// this function will return all the saved workout programs
  /// as in order
  static Future<Map<int, WorkoutModel>> getAllWorkoutModels() async {
    final workoutProgramBox = await Hive.openBox<WorkoutModel>(
      CacheHiveBoxConstants.workoutModelBox,
    );

    return Map<int, WorkoutModel>.from(
      workoutProgramBox.toMap(),
    );
  }

  /*
    Training part
  */

  static Future<void> saveTraining({required TrainingModel model}) async {
    final trainingsBox = await Hive.openBox<TrainingModel>(
      CacheHiveBoxConstants.trainingModelBox,
    );
    await trainingsBox.put(
      DateFormatterUtil.trainingHiveBoxDateKey(model.date).toString(),
      model,
    );
  }

  static Future<List<TrainingModel>> getAllTrainings() async {
    final trainingsBox = await Hive.openBox<TrainingModel>(
      CacheHiveBoxConstants.trainingModelBox,
    );
    final modelsMap = trainingsBox.toMap();
    final models = <TrainingModel>[];
    for (final element in modelsMap.keys) {
      models.add(modelsMap[element]!);
    }
    return models;
  }
}
