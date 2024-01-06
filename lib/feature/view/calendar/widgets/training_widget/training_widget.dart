part of '../../calendar_view.dart';

/// Training show widget for calender page
final class TrainingWidget extends StatelessWidget {
  const TrainingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalenderViewCubit, DateTime>(
      builder: (context, date) {
        return Column(
          children: [
            _SelectedDateText(date: date),
            IntractableContainer(
              onTap: () =>
                  context.read<CalenderViewCubit>().selectWorkoutModel(context),
            ),
          ],
        );
      },
    );
  }
}

final class _SelectedDateText extends StatelessWidget {
  const _SelectedDateText({required this.date});

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(
        left: 12,
      ),
      child: Text(
        DateFormatterUtil.generateDateText(date),
        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
