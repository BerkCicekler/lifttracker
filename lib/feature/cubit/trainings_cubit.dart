import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lifttracker/product/cache/hive_utility.dart';
import 'package:lifttracker/product/extensions/date_time_extension.dart';
import 'package:lifttracker/product/model/training_done_model.dart';

/// a cubit for providing user's all trainings to the app
final class TrainingsCubit extends Cubit<Map<DateTime, TrainingModel>> {
  /// initial value will be empty map
  TrainingsCubit() : super({});

  /// a list will hold the all past trainings date as
  /// ordered from new to old
  final _dateTimes = <DateTime>[];

  /// a list will hold the all past trainings date as
  /// ordered from new to old
  List<DateTime> get dateTimes => _dateTimes;

  /// will fetch the all past trainings from the cache
  ///
  Future<void> fetchAllTrainings() async {
    final allTrainings = await CacheManager.getAllTrainings();
    final newState = <DateTime, TrainingModel>{};
    for (var i = 0; i < allTrainings.length; i++) {
      _dateTimes.add(allTrainings[i].date);

      newState[allTrainings[i].date] = allTrainings[i];
    }
    _updateOrderOfDateTimesList();
    emit(newState);
  }

  void addNewTrainingToState(DateTime date, TrainingModel model) {
    final tempState = Map<DateTime, TrainingModel>.from(state);
    final pureDate = date.toPureDate();
    tempState[pureDate] = model;
    _dateTimes.add(pureDate);
    emit(tempState);
    _updateOrderOfDateTimesList();
  }

  void _updateOrderOfDateTimesList() {
    _dateTimes.sort((a, b) => b.compareTo(a));
  }
}
