/// A Model for NumberTextField
/// will make the value change edit actions easy
class NumberTextFieldControllerModel {
  /// main constructor
  NumberTextFieldControllerModel({
    required this.startValue,
    required this.incrementAmount,
    required this.decrementAmount,
    this.minValue = 1,
    this.canBeFraction = false,
  }) {
    _currentValue = startValue;
  }

  /// the first Value of [currentValue]
  final double startValue;

  /// When the [increment] method executed
  /// the value will increase as much as [incrementAmount] value
  final double incrementAmount;

  /// When the [decrement] method executed
  /// the value will decrease as much as [decrementAmount] value
  final double decrementAmount;

  /// minimum value can value take
  double minValue;

  /// can be fraction
  bool canBeFraction;

  late double _currentValue;

  /// for getting the value as double
  double get currentValue => _currentValue;

  /// for getting the value as String
  /// if the [canBeFraction] is false the value will return like an int
  String get currentValueStringFixed => _returnAsFixedString();

  set currentValue(double value) {
    if (value > minValue) {
      _currentValue = value;
    } else {
      _currentValue = minValue;
    }
  }

  /// Will increment the value as much as [incrementAmount] value
  /// amount variable given
  void increment() {
    _currentValue += incrementAmount;
  }

  /// Will decrease the value as much as [decrementAmount] value
  /// amount variable given
  /// and if the value gets lower than [minValue] it will automatically change
  /// the value with [minValue]
  void decrement() {
    if (minValue > (_currentValue - decrementAmount)) {
      _currentValue = minValue;
    } else {
      _currentValue -= decrementAmount;
    }
  }

  String _returnAsFixedString() {
    String currentText = currentValue.toString();
    currentText = currentText.replaceAll(' ', '');
    if (!canBeFraction) {
      currentText = currentText.replaceAll(',', '');
      currentText = currentText.replaceAll('.', '');
      currentText = currentText.substring(0, currentText.length - 1);
    }
    return currentText;
  }
}
