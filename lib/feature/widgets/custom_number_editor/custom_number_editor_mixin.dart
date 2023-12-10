import 'package:flutter/widgets.dart';
import 'package:lifttracker/feature/widgets/custom_number_editor/custom_number_editor.dart';
import 'package:lifttracker/feature/widgets/custom_number_editor/number_text_field_model.dart';

/// Custom Number Editor widget's operation mixin
mixin CustomNumberEditorOperation on State<CustomNumberEditor> {
  /// TextField's controller
  late TextEditingController valueController;

  /// value
  late NumberTextFieldControllerModel model;

  @override
  void initState() {
    super.initState();
    model = NumberTextFieldControllerModel(
      startValue: widget.startValue,
      incrementAmount: widget.incrementAmount,
      decrementAmount: widget.decrementAmount,
      canBeFraction: widget.canBeFraction,
      minValue: widget.minValue,
    );
    valueController = TextEditingController();
    getLastValue();
    setState(() {});
  }

  /// for setting the [valueController]'s .text value to model's value
  void getLastValue() {
    valueController.text = model.currentValueStringFixed;
  }

  /// Increment icon method will increment the value as much increment
  /// amount variable given the widget
  void incrementIconOnTap() {
    model.increment();
    getLastValue();
    setState(() {});
    widget.onValueChange(model.currentValue);
  }

  /// Decrement icon method will decrease the value as much decrement
  /// amount variable given the widget
  void decrementIconOnTap() {
    model.decrement();
    getLastValue();
    setState(() {});
    widget.onValueChange(model.currentValue);
  }

  /// On The TextFieldChange
  void onChange(String val) {
    val = val.replaceAll(',', '.');
    model.currentValue = double.parse(val != '' ? val : '0');
    widget.onValueChange(model.currentValue);
  }

  /// on The Editing Complete
  void onEditingComplete() {
    getLastValue();
    setState(() {});
  }
}
