import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lifttracker/feature/cubit/trainings_cubit.dart';
import 'package:lifttracker/feature/widgets/information_container.dart';
import 'package:lifttracker/feature/widgets/workout_done_list_tile.dart';
import 'package:lifttracker/product/constants/color_constants.dart';
import 'package:lifttracker/product/constants/enums/padding_enums.dart';

part 'widgets/training_status.dart';
part 'widgets/last_trainings.dart';

/// Home screen class
@RoutePage()
final class HomeView extends StatelessWidget {
  /// Home screen constructor
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(PaddingConstants.page.value),
      child: const Column(
        children: [
          _TrainingStatus(),
          Spacer(),
          _LastTrainings(),
        ],
      ),
    );
  }
}
