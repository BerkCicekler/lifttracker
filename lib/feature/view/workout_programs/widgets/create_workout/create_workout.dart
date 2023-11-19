part of '../../workout_programs_view.dart';

/// this widget will ask the
class CreateNewWorkoutContainer extends StatelessWidget {
  /// this widget will ask the
  const CreateNewWorkoutContainer({super.key});

  Future<void> _createNewWorkoutProgram(BuildContext context) async {
    final respond =
        await TextInputDialog.show(context: context, title: 'Workout name');
    if (respond != null && respond.isNotEmpty) {
      print(respond);
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () => _createNewWorkoutProgram(context),
      child: Container(
        width: width * 0.95,
        height: 100,
        padding: EdgeInsets.all(PaddingConstants.small.value),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: ColorConstants.lightGreen),
          color: const Color.fromARGB(24, 220, 251, 19),
        ),
        child: const Center(
          child: Icon(
            Icons.add,
            size: 30,
          ),
        ),
      ),
    );
  }
}
