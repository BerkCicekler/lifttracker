part of '../home_view.dart';

final class _TrainingStatus extends StatelessWidget {
  const _TrainingStatus();

  @override
  Widget build(BuildContext context) {
    final currentDate = DateTime.now().toPureDate();
    final trainings = context.watch<TrainingsCubit>().state;
    num monthlyWorkoutCount = 0;
    num weeklyWorkoutCount = 0;

    for (var i = 1; i <= currentDate.getDayAmountOfMonth(); i++) {
      if (trainings[DateTime(currentDate.year, currentDate.month, i)] != null) {
        monthlyWorkoutCount++;
      }
    }

    for (final element in currentDate.getWeekDaysAsDateTime()) {
      if (trainings[element] != null) {
        weeklyWorkoutCount++;
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomInformationContainer(
          title: 'home.countWorkoutWeek'.tr(),
          number: weeklyWorkoutCount.toString(),
        ),
        CustomInformationContainer(
          title: 'home.countWorkoutMonth'.tr(),
          number: monthlyWorkoutCount.toString(),
        ),
      ],
    );
  }
}
