import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lifttracker/product/constants/enums/padding_enums.dart';

@RoutePage()
class WorkoutProgramEditorView extends StatelessWidget {
  const WorkoutProgramEditorView({
    required this.workoutId,
    super.key,
  });

  final int workoutId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hehe'),
      ),
      body: Padding(
        padding: EdgeInsets.all(PaddingConstants.page.value),
        child: const Center(
          child: Column(
            children: [Text('hi')],
          ),
        ),
      ),
    );
  }
}
