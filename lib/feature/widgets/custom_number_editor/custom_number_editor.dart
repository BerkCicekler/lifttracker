import 'package:flutter/material.dart';
import 'package:lifttracker/feature/widgets/custom_number_editor/custom_number_editor_mixin.dart';

@immutable

/// A custom widget for getting number data from user
final class CustomNumberEditor extends StatefulWidget {
  /// A custom widget for getting number data from user
  /// [startValue] first value of widget
  /// [incrementAmount] Increment value will increase the value on increment
  /// icon tap much as this value
  /// [decrementAmount] Decrement value will decrease the value on decrement
  /// icon tap much as this value
  /// [onValueChange] this method will run every time user made a change on
  /// number. This method will send a double argument.
  /// [minValue] Minimum value can be given
  /// [canBeFraction] Can use fraction value
  CustomNumberEditor({
    required this.startValue,
    required this.incrementAmount,
    required this.decrementAmount,
    required this.onValueChange,
    this.minValue = 1,
    this.canBeFraction = false,
    super.key,
  });

  /// the first Value of widget
  final double startValue;

  /// increment button on tap increase amount
  final double incrementAmount;

  /// decrement button on tap decrease amount
  final double decrementAmount;

  /// minimum value can value take
  double minValue;

  /// can be fraction
  bool canBeFraction;

  /// on value change
  final void Function(double) onValueChange;

  @override
  State<CustomNumberEditor> createState() => _CustomNumberEditorState();
}

class _CustomNumberEditorState extends State<CustomNumberEditor>
    with CustomNumberEditorOperation {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 20,
            height: 20,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.red),
            ),
            child: FittedBox(
              child: IconButton(
                onPressed: decrementIconOnTap,
                icon: const Icon(
                  Icons.remove,
                  size: 180,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 25,
            child: TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              controller: valueController,
              onChanged: onChange,
              onEditingComplete: onEditingComplete,
            ),
          ),
          Container(
            width: 20,
            height: 20,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.green),
            ),
            child: FittedBox(
              child: IconButton(
                onPressed: incrementIconOnTap,
                icon: const Icon(
                  Icons.add,
                  size: 180,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
