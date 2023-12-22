part of '../../workout_program_editor_view.dart';

///
class EditExerciseDefaultsContainer extends StatefulWidget {
  /// Exercise editor container for an exercise
  /// [exerciseKeyId] should be the value of the index of the
  /// [exerciseModel] so the the user made a change this widget
  /// will update the model by the given index
  const EditExerciseDefaultsContainer({
    required this.exerciseKeyId,
    required this.exerciseModel,
    super.key,
  });

  /// exercise index for update the exerciseModel
  final int exerciseKeyId;

  /// default exerciseModel passed in the constructor
  final ExerciseModel exerciseModel;

  @override
  State<EditExerciseDefaultsContainer> createState() =>
      _EditExerciseDefaultsContainerState();
}

class _EditExerciseDefaultsContainerState
    extends State<EditExerciseDefaultsContainer>
    with EditExerciseDefaultsContainerOperation {
  /// for the texts used inside this container
  final _customTextStyle = const TextStyle(
    fontSize: 18,
  );

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
            decoration: InputDecoration(
              hintText: 'workoutProgramEditor.exerciseName'.tr(),
              border: InputBorder.none,
              contentPadding: EdgeInsets.zero,
              isDense: true,
            ),
            style: const TextStyle(fontSize: 22),
          ),
          Row(
            children: [
              Text(
                'workoutProgramEditor.setCount'.tr(),
                style: _customTextStyle,
              ),
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
              Text(
                'workoutProgramEditor.repCount'.tr(),
                style: _customTextStyle,
              ),
              CustomNumberEditor(
                startValue: widget.exerciseModel.defaultRepCount.toDouble(),
                incrementAmount: 1,
                decrementAmount: 1,
                onValueChange: (val) => onValueChange(
                  changeType: 'rep',
                  value: val,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'workoutProgramEditor.weight'.tr(),
                style: _customTextStyle,
              ),
              CustomNumberEditor(
                startValue: widget.exerciseModel.defaultWeightCount,
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
