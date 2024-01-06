// ignore_for_file: public_member_api_docs

import 'package:hive/hive.dart';

import 'package:lifttracker/product/model/exercise_model.dart';
import 'package:lifttracker/product/model/set_model.dart';
import 'package:lifttracker/product/model/workout_model.dart';

typedef TrainingMap = Map<ExerciseModel, List<SetModel>>;

/// this class will be used to log the user's exercises
/// on the calender
@HiveType(typeId: 3)
class TrainingModel {
  /// [note] should be the user's note about the exercise
  /// [date] date of the training
  /// [model] should be the selected workout program
  TrainingModel({
    required WorkoutModel? model,
    required TrainingMap? training,
    required this.note,
    required this.date,
  }) {
    if (model != null) {
      final TrainingMap tempTraining = {};
      for (final exercise in model.exercises) {
        final sets = <SetModel>[];

        for (var i = 0; i < exercise.defaultSetCount; i++) {
          sets.add(
            SetModel(
              weight: exercise.defaultWeightCount,
              reps: exercise.defaultRepCount,
            ),
          );
        }

        tempTraining[exercise] = sets;
      }
      this.training = tempTraining;
    } else {
      this.training = training!;
    }
  }

  /// User's note about the exercise
  @HiveField(0)
  final String note;

  /// the training log
  @HiveField(1)
  late final TrainingMap training;

  /// date of the exercise
  @HiveField(2)
  final DateTime date;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'note': note,
      'date': date.millisecondsSinceEpoch,
      'training': training,
    };
  }

  //TODO: write it better
  factory TrainingModel.fromHiveMap(Map<dynamic, dynamic> map) {
    final jsonTraining = map['training'] as Map<dynamic, dynamic>;
    final TrainingMap tempTraining = {};
    for (final element in jsonTraining.keys) {
      tempTraining[element as ExerciseModel] = List<SetModel>.generate(
          (jsonTraining[element] as List<dynamic>).length, (index) {
        return jsonTraining[element][index] as SetModel;
      });
    }

    return TrainingModel(
      model: null,
      training: tempTraining,
      note: map['note'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
    );
  }
}

final class TrainingModelAdapter extends TypeAdapter<TrainingModel> {
  @override
  int get typeId => 3;

  @override
  TrainingModel read(BinaryReader reader) {
    final map = reader.readMap();
    return TrainingModel.fromHiveMap(map);
  }

  @override
  void write(BinaryWriter writer, TrainingModel obj) {
    writer.writeMap(obj.toMap());
  }
}
