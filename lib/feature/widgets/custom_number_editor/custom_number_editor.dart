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
  const CustomNumberEditor({
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
  final double minValue;

  /// can be fraction
  final bool canBeFraction;

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
          _CustomIconButton(
            onTap: decrementIconOnTap,
            icon: Icons.remove,
            color: const Color.fromARGB(255, 235, 51, 38),
          ),
          SizedBox(
            width: 35,
            child: TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              controller: valueController,
              onChanged: onChange,
              onEditingComplete: onEditingComplete,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
          _CustomIconButton(
            onTap: incrementIconOnTap,
            icon: Icons.add,
            color: const Color.fromARGB(255, 76, 216, 81),
          ),
        ],
      ),
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  const _CustomIconButton({
    required this.onTap,
    required this.icon,
    required this.color,
  });

  final void Function() onTap;

  final IconData icon;

  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 25,
        height: 25,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 83, 83, 88),
          shape: BoxShape.circle,
        ),
        child: FittedBox(
          child: Icon(
            icon,
            color: color,
          ),
        ),
      ),
    );
  }
}
