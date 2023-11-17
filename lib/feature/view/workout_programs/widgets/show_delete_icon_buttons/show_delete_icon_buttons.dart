part of '../../workout_programs_view.dart';

/// its an utility to show the exercise page or delete the exercise
class ShowDeleteIconButtonView extends StatelessWidget {
  /// its an utility to show the exercise page or delete the exercise
  /// [workOutId] the workout id of that will showed the view page or delete
  const ShowDeleteIconButtonView({required this.workOutId, super.key});

  /// the id of workout
  final String workOutId;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.delete_outline,
            color: Color.fromARGB(255, 221, 60, 49),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.remove_red_eye_outlined,
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}
