import 'package:flutter/material.dart';
import 'package:lifttracker/product/constants/enums/padding_enums.dart';

///
class WorkOutEditorContainer extends StatelessWidget {
  /// to-do: add comment
  const WorkOutEditorContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.95,
      height: 150,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Color(0xFF33363b),
      ),
      padding: EdgeInsets.all(PaddingConstants.small.value),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Leg Curl',
            style: TextStyle(fontSize: 25, fontFamily: 'RobotoBlack'),
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text('Weight'), Text('rep')],
              )
            ],
          )
        ],
      ),
    );
  }
}
