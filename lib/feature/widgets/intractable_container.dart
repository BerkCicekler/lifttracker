import 'package:flutter/material.dart';
import 'package:lifttracker/product/constants/color_constants.dart';
import 'package:lifttracker/product/constants/enums/padding_enums.dart';

/// A widget for get the user's tap action and perform an action
final class IntractableContainer extends StatelessWidget {
  /// clickable container created for getting onTap actions from user
  const IntractableContainer({
    required this.onTap,
    this.width,
    this.height,
    super.key,
  });

  /// on container tap
  final void Function() onTap;

  /// width of the container
  final double? width;

  /// height of the container
  final double? height;

  @override
  Widget build(BuildContext context) {
    final defaultWidth = MediaQuery.of(context).size.width * 0.95;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width ?? defaultWidth,
        height: height ?? 100,
        padding: EdgeInsets.all(PaddingConstants.small.value),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: ColorConstants.lightGreen),
          color: const Color.fromARGB(24, 220, 251, 19),
        ),
        child: const Center(
          child: Icon(
            Icons.add,
            size: 30,
          ),
        ),
      ),
    );
  }
}
