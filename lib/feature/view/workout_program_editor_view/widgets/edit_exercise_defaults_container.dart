part of '../workout_program_editor_view.dart';

class EditExerciseDefaultsContainer extends StatefulWidget {
  const EditExerciseDefaultsContainer(
      {required this.exerciseKeyId, required this.exerciseModel, super.key});

  final int exerciseKeyId;
  final ExerciseModel exerciseModel;

  @override
  State<EditExerciseDefaultsContainer> createState() =>
      _EditExerciseDefaultsContainerState();
}

class _EditExerciseDefaultsContainerState
    extends State<EditExerciseDefaultsContainer> {
  late TextEditingController exerciseNameController;

  @override
  void initState() {
    super.initState();
    exerciseNameController = TextEditingController();

    exerciseNameController.text = widget.exerciseModel.exerciseName;
  }

  @override
  void dispose() {
    super.dispose();
    exerciseNameController.dispose();
  }

  void _save() {}

  @override
  Widget build(BuildContext context) {
    final num width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.95,
      height: 100,
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
        ],
      ),
    );
  }
}
