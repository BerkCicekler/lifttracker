/// Exercise model class for exercise data
final class ExerciseModel {
  /// Exercise model constructor for just 1 movement
  ExerciseModel({
    required this.exerciseName,
    required this.defaultSetCount,
    required this.defaultRepCount,
    required this.defaultWeightCount,
  });

  /// Exercise's name
  final String exerciseName;

  /// The default set count value will create all the sets automatic
  final int defaultSetCount;

  /// The default rep count value will set
  /// the rep values of all sets to this value
  final int defaultRepCount;

  /// The default weight count value will set
  /// the weight values of all sets to this value
  final int defaultWeightCount;

  // buraya bir set listesi ekle constructerda oluştur fln
}
