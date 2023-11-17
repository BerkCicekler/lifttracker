part of '../workout_programs_view.dart';

/// this widget
class CreateNewWorkout extends StatelessWidget {
  const CreateNewWorkout({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        TextInputDialog.show(context: context, title: 'Workout name');
      },
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