import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

/// Home screen class
@RoutePage()
class SettingsView extends StatelessWidget {
  /// Home screen constructer
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text("hi")],
    );
  }
}
