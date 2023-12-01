import 'package:flutter/widgets.dart';
import 'package:lifttracker/feature/widgets/custom_number_editor/custom_number_editor.dart';

/// Custom Number Editor widget's operation mixin
mixin CustomNumberEditorOperation on State<CustomNumberEditor> {
  /// TextField's controller
  late TextEditingController valueController;

  /// value
  late double currentValue;

  @override
  void initState() {
    super.initState();
    valueController = TextEditingController();
    valueController.text = widget.startValue.toString();
    currentValue = widget.startValue;
    onChange();
  }

  /// Increment icon method will increment the value as much increment
  /// amount variable given the widget
  void incrementIconOnTap() {
    currentValue += widget.incrementAmount;
    valueController.text = currentValue.toString();
    setState(() {});
    onChange();
  }

  /// Decrement icon method will decrease the value as much decrement
  /// amount variable given the widget
  void decrementIconOnTap() {
    currentValue -= widget.decrementAmount;
    valueController.text = currentValue.toString();
    setState(() {});
    onChange();
  }

  /// TextField's onChange method the reason is val's have a default value
  /// is because onChange method will not only handling the TextField's
  /// onChange method
  void onChange({String val = ' '}) {
    if (currentValue < widget.minValue || val == '') {
      _minValueFix();
    }
    if (!_isNumberValid()) {
      _fix();
    }
    currentValue = double.parse(valueController.text);
    widget.onValueChange(currentValue);
  }

  void _minValueFix() {
    currentValue = widget.minValue;
    valueController.text = currentValue.toString();
    setState(() {});
  }

  bool _isNumberValid() {
    final String currentText = valueController.text;
    if (widget.canBeFraction) {
      return !currentText.contains(' ');
    } else {
      return !(currentText.contains(' ') ||
          currentText.contains(',') ||
          currentText.contains('.'));
    }
  }

  void _fix() {
    String currentText = valueController.text;
    currentText = currentText.replaceAll(' ', '');
    if (!widget.canBeFraction) {
      currentText = currentText.replaceAll(',', '');
      currentText = currentText.replaceAll('.', '');
      currentText = currentText.substring(0, currentText.length - 1);
    }
    valueController.text = currentText;
    setState(() {});
  }
}
