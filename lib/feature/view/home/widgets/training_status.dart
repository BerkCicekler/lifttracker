part of '../home_view.dart';

final class _TrainingStatus extends StatelessWidget {
  const _TrainingStatus();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomInformationContainer(
          title: 'home.countWorkoutMonth'.tr(),
          number: '4',
        ),
        CustomInformationContainer(
          title: 'home.countWorkoutWeek'.tr(),
          number: '19',
        ),
      ],
    );
  }
}
