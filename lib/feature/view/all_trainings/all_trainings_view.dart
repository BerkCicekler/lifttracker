import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lifttracker/feature/cubit/trainings_cubit.dart';
import 'package:lifttracker/feature/widgets/workout_done_list_tile.dart';
import 'package:lifttracker/product/constants/enums/padding_enums.dart';

/// A page for showing all past trainings
@RoutePage()
final class AllTrainingsView extends StatelessWidget {
  /// A page for showing all past trainings
  const AllTrainingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'general.history'.tr(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(PaddingConstants.page.value),
        child: const _HistoryListView(),
      ),
    );
  }
}

class _HistoryListView extends StatelessWidget {
  const _HistoryListView();

  @override
  Widget build(BuildContext context) {
    final trainingCubit = context.read<TrainingsCubit>();
    return ListView.builder(
      itemCount: trainingCubit.dateTimes.length,
      itemBuilder: (_, index) {
        return WorkoutDoneListTile(
          trainingModel: trainingCubit.state[trainingCubit.dateTimes[index]]!,
          isOdd: ((index + 1) % 2) == 1,
        );
      },
    );
  }
}
