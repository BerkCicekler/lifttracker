import 'package:flutter/material.dart';
import 'package:lifttracker/product/constants/enums/padding_enums.dart';

/// Container that gives basic information on home view
class CustomInformationContainer extends StatelessWidget {
  /// Create a container where u can show information about a topic with count
  /// [title] title of information
  /// [number] title's data value
  const CustomInformationContainer({
    required this.title,
    required this.number,
    super.key,
  });

  /// title text of information
  final String title;

  /// title's count data
  final String number;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.46,
      height: width * 0.46,
      padding: EdgeInsets.all(PaddingConstants.medium.value),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Color(0xFF33363b),
      ),
      child: Column(
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Text(
            number,
            style: TextStyle(fontSize: 45),
          )
        ],
      ),
    );
  }
}
