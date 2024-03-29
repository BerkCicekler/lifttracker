part of '../home_view.dart';

final class _LastTrainings extends StatelessWidget {
  const _LastTrainings();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height * 0.32,
      width: width * 0.90,
      child: const Column(
        children: [
          _AboveListViewHeader(),
          Expanded(
            child: _WorkoutsDoneListView(),
          ),
        ],
      ),
    );
  }
}

final class _AboveListViewHeader extends StatelessWidget {
  const _AboveListViewHeader();

  void _onViewAllTap(BuildContext context) {
    print("yes");
    context.router.push(const AllTrainingsRoute());
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'general.history'.tr(),
          style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        RichText(
          text: TextSpan(
            text: 'home.viewAll'.tr(),
            recognizer: TapGestureRecognizer()
              ..onTap = () => _onViewAllTap(context),
            style: const TextStyle(
              color: ColorConstants.lightGreen,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

final class _WorkoutsDoneListView extends StatelessWidget {
  const _WorkoutsDoneListView();

  @override
  Widget build(BuildContext context) {
    final trainings = context.watch<TrainingsCubit>().state;
    final dateTimes = context.read<TrainingsCubit>().dateTimes;
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: (dateTimes.length > 4 ? 4 : dateTimes.length),
      itemBuilder: (_, index) {
        return WorkoutDoneListTile(
          trainingModel: trainings[dateTimes[index]]!,
          isOdd: ((index + 1) % 2) == 1,
        );
      },
    );
  }
}
