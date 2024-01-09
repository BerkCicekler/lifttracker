part of '../calendar_view.dart';

final class _TrainingContainer extends StatelessWidget {
  const _TrainingContainer({required this.model});

  final TrainingModel model;

  @override
  Widget build(BuildContext context) {
    final exerciseCount = model.training.length.toString();
    num setCount = 0;
    for (final exercise in model.training.keys) {
      setCount += model.training[exercise]!.length;
    }

    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.95,
      height: 100,
      padding: EdgeInsets.all(PaddingConstants.small.value),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: ColorConstants.containerGrey,
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.name,
                style: const TextStyle(
                  fontSize: 22,
                  fontFamily: 'RobotoBlack',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'workoutProgram.exerciseCount'.tr(args: [exerciseCount]),
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                'workoutProgram.setCount'.tr(args: [setCount.toString()]),
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
