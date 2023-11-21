import 'package:flutter/material.dart';

class CustomNumberEditor extends StatelessWidget {
  const CustomNumberEditor({super.key});

  ///TODO : create the widget

  @override
  Widget build(BuildContext context) {
    return Row(
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
              onPressed: () {},
              icon: Icon(
                Icons.remove,
                size: 180,
              ),
            ),
          ),
        ),
        Text('5'),
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
              onPressed: () {},
              icon: Icon(
                Icons.add,
                size: 180,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
