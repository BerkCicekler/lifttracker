import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:lifttracker/feature/widgets/information_container.dart';
import 'package:lifttracker/product/constants/enums/padding_enums.dart';

/// Home screen class
@RoutePage()
class HomeView extends StatelessWidget {
  /// Home screen constructor
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(PaddingConstants.page.value),
      child: const Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomInformationContainer(
                    title: 'Workout count of week',
                    number: '4',
                  ),
                  CustomInformationContainer(
                    title: 'Workout count of month',
                    number: '19',
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
