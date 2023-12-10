part of '../../workout_program_editor_view.dart';

class EditExerciseDefaultsContainer extends StatefulWidget {
  const EditExerciseDefaultsContainer({
    required this.exerciseKeyId,
    required this.exerciseModel,
    super.key,
  });

  final int exerciseKeyId;
  final ExerciseModel exerciseModel;

  @override
  State<EditExerciseDefaultsContainer> createState() =>
      _EditExerciseDefaultsContainerState();
}

class _EditExerciseDefaultsContainerState
    extends State<EditExerciseDefaultsContainer>
    with EditExerciseDefaultsContainerOperation {
  @override
  Widget build(BuildContext context) {
    final num width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.95,
      height: 230,
      padding: EdgeInsets.all(PaddingConstants.small.value),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: ColorConstants.containerGrey,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: exerciseNameController,
          ),
          Row(
            children: [
              Text('Set'),
              CustomNumberEditor(
                startValue: widget.exerciseModel.defaultSetCount.toDouble(),
                incrementAmount: 1,
                decrementAmount: 1,
                onValueChange: (val) => onValueChange(
                  changeType: 'set',
                  value: val,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text('Rep'),
              CustomNumberEditor(
                startValue: widget.exerciseModel.defaultSetCount.toDouble(),
                incrementAmount: 1,
                decrementAmount: 1,
                onValueChange: (val) => onValueChange(
                  changeType: 'Rep',
                  value: val,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text('Weight'),
              CustomNumberEditor(
                startValue: widget.exerciseModel.defaultSetCount.toDouble(),
                incrementAmount: 1.25,
                decrementAmount: 1.25,
                canBeFraction: true,
                onValueChange: (val) => onValueChange(
                  changeType: 'weight',
                  value: val,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
