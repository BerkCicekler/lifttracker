import 'package:lifttracker/product/constants/enums/set_types.dart';

/// exercise set model
final class SetModel {
  ///TODO: documentation
  SetModel({
    required this.weight,
    required this.reps,
    this.setType = SetType.none,
  });

  /// Weight of the set
  final String weight;

  /// rep count of the set
  final String reps;

  /// set finish type
  final SetType setType;
}
