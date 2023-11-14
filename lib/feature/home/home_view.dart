import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

/// Home screen class
@RoutePage()
class HomeView extends StatelessWidget {
  /// Home screen constructer
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lift Tracker"),
      ),
      body: Column(children: []),
    );
  }
}
