import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

/// Home screen class
@RoutePage()
class HomeView extends StatelessWidget {
  /// Home screen constructer
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                CustomYearAndMonthSelector.show(context: context);
              },
              child: Text("test"))
        ],
      ),
    );
  }
}
