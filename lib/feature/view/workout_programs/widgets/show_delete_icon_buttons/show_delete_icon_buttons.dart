part of '../../workout_programs_view.dart';

/// its an utility to show the exercise page or delete the exercise
class ShowDeleteIconButtonView extends StatelessWidget {
  /// its an utility to show the exercise page or delete the exercise
  /// [workoutId] the workout id of that will showed the view page or delete
  /// [workoutModel]
  const ShowDeleteIconButtonView({
    required this.workoutModel,
    required this.workoutId,
    super.key,
  });

  /// the id of workout
  final int workoutId;

  /// workout model for send the data to workout program editor view
  final WorkoutModel workoutModel;

  void _deleteOnTap(BuildContext context) async {
    bool? decision = await CustomActionDialog.show(
      context: context,
      title: 'Are you sure?',
      contextText: 'Are you sure you want to delete this program',
      okText: 'general.ok'.tr(),
      cancelText: 'general.cancel'.tr(),
    );
    if (decision != null && decision != false) {
      await HiveCacheManager.removeWorkOutProgram(id: workoutId);
    }
  }

  void _showOnTap(BuildContext context) {
    context.router.push(
      WorkoutProgramEditorRoute(
        workoutId: workoutId,
        workoutModel: workoutModel,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => _deleteOnTap(context),
          icon: const Icon(
            Icons.delete_outline,
            color: Color.fromARGB(255, 221, 60, 49),
          ),
        ),
        IconButton(
          onPressed: () => _showOnTap(context),
          icon: const Icon(
            Icons.remove_red_eye_outlined,
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}
