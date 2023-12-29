// ignore_for_file: public_member_api_docs

import 'package:bloc/bloc.dart';

final class TrainingsBloc extends Bloc<TrainingsEvent, TrainingsState> {
  TrainingsBloc() : super(TrainingsFetchedState({})) {
    on<TrainingsFetchEvent>(_fetchTrainings);
  }

  void _fetchTrainings(
    TrainingsFetchEvent event,
    Emitter<TrainingsState> emit,
  ) {}
}

sealed class TrainingsEvent {}

class TrainingsFetchEvent extends TrainingsEvent {}

sealed class TrainingsState {}

class TrainingsFetchedState extends TrainingsState {
  TrainingsFetchedState(this.trainings);
  Map<DateTime, dynamic> trainings;
}
