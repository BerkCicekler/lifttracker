import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lifttracker/product/cache/hive_utility.dart';
import 'package:lifttracker/product/model/training_done_model.dart';

/// a cubit for providing user's all trainings to the app
final class TrainingsCubit extends Cubit<Map<DateTime, TrainingModel>> {
  /// initial value will be empty map
  TrainingsCubit() : super({});

  Future<void> fetchAllTrainings() async {
    final allTrainings = await CacheManager.getAllTrainings();
    final newState = <DateTime, TrainingModel>{};
    for (var i = 0; i < allTrainings.length; i++) {
      print('sex');
      newState[allTrainings[i].date] = allTrainings[i];
    }
    print(newState);
    emit(newState);
  }
}
