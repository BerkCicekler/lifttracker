import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

/// Home screen class
@RoutePage()
final class SettingsView extends StatelessWidget {
  /// Home screen constructor
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [Text('hi')],
    );
  }
}
